package items

import (
	"encoding/json"
	"regexp"
	"strconv"

	"github.com/google/uuid"

	"github.com/Masterminds/squirrel"
	"github.com/gofiber/fiber/v2"
	"github.com/jmoiron/sqlx"
	"github.com/rdoneux/nmna-api/models"
)

type ItemsController struct {
	DB *sqlx.DB
}

func (itemsController *ItemsController) GetItemById(ctx *fiber.Ctx) error {

	db := itemsController.DB
	itemId := ctx.Params("itemId")

	item, err := GetItemById(*db, itemId)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(item)

}

func (itemsController *ItemsController) FindItemsByQuery(ctx *fiber.Ctx) error {

	db := itemsController.DB

	queryName := ctx.Query("name")
	queryType := ctx.Query("type")
	priceMax := ctx.Query("priceMax")
	priceMin := ctx.Query("priceMin")

	search := squirrel.
		Select("id",
			"name",
			"description",
			"item_type",
			"weight",
			"price").
		From("items")

	if queryName != "" {
		search = search.Where("name LIKE ?", "%"+queryName+"%")
	}

	if queryType != "" {
		search = search.Where("item_type = ?", queryType)
	}

	if priceMax != "" {
		max, err := strconv.Atoi(priceMax)
		if err != nil {
			return fiber.NewError(fiber.StatusBadRequest, "Invalid priceMax")
		}
		search = search.Where("price <= ?", max)
	}

	if priceMin != "" {
		min, err := strconv.Atoi(priceMin)
		if err != nil {
			return fiber.NewError(fiber.StatusBadRequest, "Invalid priceMin")
		}
		search = search.Where("price >= ?", min)
	}

	query, args, err := search.ToSql()
	if err != nil {
		return err
	}

	var items []models.ListItem = make([]models.ListItem, 0)
	err = db.Select(&items, query, args...)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(items)

}

func (itemsController *ItemsController) GetItemTypes(ctx *fiber.Ctx) error {

	itemTypes, err := GetItemTypes(*itemsController.DB)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(itemTypes)
}

func (itemsController *ItemsController) GetEquipLocations(ctx *fiber.Ctx) error {

	db := itemsController.DB

	var columnType string
	err := db.Get(&columnType, "SELECT COLUMN_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'character_worn_items' AND COLUMN_NAME = 'location'")
	if err != nil {
		return err
	}

	regex := regexp.MustCompile(`'([^']*)'`)
	matches := regex.FindAllStringSubmatch(columnType, -1)

	var enumValues []string
	for _, match := range matches {
		enumValues = append(enumValues, match[1])
	}

	return ctx.Status(fiber.StatusOK).JSON(enumValues)

}

func (itemsController *ItemsController) CreateItem(ctx *fiber.Ctx) error {

	db := itemsController.DB
	id := uuid.New().String()

	var itemMap map[string]any
	err := ctx.BodyParser(&itemMap)
	if err != nil {
		return err
	}

	itemType, ok := itemMap["itemType"].(string)
	if !ok {
		return fiber.NewError(fiber.StatusBadRequest, "itemType is required and must be a string")
	}

	// insert base item
	itemJson, err := json.Marshal(itemMap)
	if err != nil {
		return err
	}

	var item models.Item
	err = json.Unmarshal(itemJson, &item)
	item.ID = id
	if err != nil {
		return err
	}

	err = CreateItem(*db, item)

	// create super item
	targetTable := models.ItemTypeToTable[itemType]

	insert := squirrel.Insert(targetTable)

	switch itemType {
	case "WEAPON":

		var weapon models.Weapon
		err = json.Unmarshal(itemJson, &weapon)

		insert = insert.
			Columns("capacity", "capacity_type", "weight_type", "item_id").
			Values(weapon.Capacity, weapon.CapacityType, weapon.WeightType, id)

	case "ARTIFACT":

		var artifact models.Artifact
		err = json.Unmarshal(itemJson, &artifact)

		insert = insert.
			Columns("level_descriptor", "depletion", "effect", "item_id").
			Values(artifact.LevelDescriptor, artifact.Depletion, artifact.Effect, id)

	case "ODDITY":

		var oddity models.Oddity
		err = json.Unmarshal(itemJson, &oddity)

		insert = insert.
			Columns("item_id").
			Values(id)

	case "EQUIPMENT":

		var equipment models.Equipment
		err = json.Unmarshal(itemJson, &equipment)

		insert = insert.
			Columns("item_id").
			Values(id)

	case "AMMUNITION":

		var ammunition models.Ammunition
		err = json.Unmarshal(itemJson, &ammunition)

		insert = insert.
			Columns("item_id", "type").
			Values(id, ammunition.Type)

	case "CYPHER":

		var cypher models.Cypher
		err = json.Unmarshal(itemJson, &cypher)

		insert = insert.
			Columns("item_id", "cypher_type", "level_descriptor", "effect").
			Values(id, cypher.CypherType, cypher.LevelDescriptor, cypher.Effect)

	case "ARMOUR":

		var armour models.Armour
		err = json.Unmarshal(itemJson, &armour)

		insert = insert.
			Columns("item_id", "weight_type").
			Values(id, armour.WeightType)

	default:

	}

	query, args, err := insert.ToSql()
	if err != nil {
		return err
	}

	_, err = db.Exec(query, args...)
	if err != nil {
		return err
	}

	fullInsertedItem, err := GetItemById(*db, id)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusCreated).JSON(fullInsertedItem)

}
