package items

import (
	"regexp"
	"strconv"

	"github.com/google/uuid"

	"github.com/Masterminds/squirrel"
	"github.com/gofiber/fiber/v2"
	"github.com/jmoiron/sqlx"
	"github.com/rdoneux/nmna-api/models"
	"github.com/rdoneux/nmna-api/services"
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

	// get item. left as map because could be on of any of the item types
	var itemMap map[string]any
	err := ctx.BodyParser(&itemMap)
	if err != nil {
		return err
	}

	// the item type is used to construct custom insert statements
	itemType, ok := itemMap["itemType"].(string)
	if !ok {
		return fiber.NewError(fiber.StatusBadRequest, "itemType is required and must be a string")
	}

	// insert base item by casting the map to the Item model
	item, err := services.MapToStruct[models.Item](itemMap)
	item.ID = id
	err = CreateItem(*db, item)
	if err != nil {
		return err
	}

	// create super item
	targetTable := models.ItemTypeToTable[itemType]
	insert, err := ConstructItemInsertStatement(itemMap, id, squirrel.Insert(targetTable))
	query, args, err := insert.ToSql()
	if err != nil {
		return err
	}
	_, err = db.Exec(query, args...)
	if err != nil {
		return err
	}

	// get the inserted super item and return it to the user
	fullInsertedItem, err := GetItemById(*db, id)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusCreated).JSON(fullInsertedItem)

}

func (itemsController *ItemsController) UpdateItem(ctx *fiber.Ctx) error {

	db := itemsController.DB
	itemId := ctx.Params("itemId")

	var updateModel map[string]any
	err := ctx.BodyParser(&updateModel)
	if err != nil {
		return err
	}

	// get item
	itemMap, err := GetItemById(*db, itemId)
	if err != nil {
		return err
	}

	// the item type is used to construct custom insert statements
	itemType, ok := itemMap["item_type"].(string)
	if !ok {
		return fiber.NewError(fiber.StatusBadRequest, "itemType is required and must be a string")
	}

	// update root item
	item, err := services.MapToStruct[models.Item](updateModel)
	if err != nil {
		return err
	}
	err = UpdateRootItem(*db, item)
	if err != nil {
		return err
	}

	// construct update statement
	targetTable := models.ItemTypeToTable[itemType]
	updateStatement, err := ConstructItemUpdateStatement(updateModel, squirrel.Update(targetTable))
	if err != nil {
		return err
	}
	query, args, err := updateStatement.ToSql()
	if err != nil {
		return err
	}
	_, err = db.Exec(query, args...)
	if err != nil {
		return err
	}

	// get updated item & return to user
	updatedItem, err := GetItemById(*db, itemId)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(updatedItem)

}
