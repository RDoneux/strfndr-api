package items

import (
	"regexp"
	"strconv"

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
