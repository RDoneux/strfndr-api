package inabilities

import (
	"github.com/Masterminds/squirrel"
	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"
	"github.com/jmoiron/sqlx"
	"github.com/rdoneux/nmna-api/models"
)

type InabilitiesController struct {
	DB *sqlx.DB
}

func (inabilitiesController *InabilitiesController) GetInabilityById(ctx *fiber.Ctx) error {

	db := inabilitiesController.DB
	inabilityId := ctx.Params("inabilityId")

	inability, err := GetInabilityById(*db, inabilityId)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(inability)

}

func (inabilitiesController *InabilitiesController) FindInabilitiesByQuery(ctx *fiber.Ctx) error {

	db := inabilitiesController.DB
	queryName := ctx.Query("name")

	search := squirrel.
		Select("*").
		From("inabilities")

	if queryName != "" {
		search = search.Where("name LIKE ?", "%"+queryName+"%")
	}

	query, args, err := search.ToSql()
	if err != nil {
		return err
	}

	var inabilities []models.Inability = make([]models.Inability, 0)
	err = db.Select(&inabilities, query, args...)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(inabilities)

}

func (inabilitiesController *InabilitiesController) CreateInability(ctx *fiber.Ctx) error {

	db := inabilitiesController.DB
	id := uuid.New().String()

	var inability models.Inability
	err := ctx.BodyParser(&inability)
	inability.ID = id
	if err != nil {
		return err
	}

	err = InsertInability(*db, inability)
	if err != nil {
		return err
	}

	createdInability, err := GetInabilityById(*db, id)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusCreated).JSON(createdInability)

}

func (inabilitiesController *InabilitiesController) UpdateInability(ctx *fiber.Ctx) error {

	db := inabilitiesController.DB
	inabilityId := ctx.Params("inabilityId")

	var inability models.Inability

	err := ctx.BodyParser(&inability)
	if err != nil {
		return err
	}

	err = UpdateInability(*db, inability, inabilityId)
	if err != nil {
		return err
	}

	updatedInability, err := GetInabilityById(*db, inabilityId)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(updatedInability)

}

func (inabilitiesController *InabilitiesController) DeleteInability(ctx *fiber.Ctx) error {

	db := inabilitiesController.DB
	inabilitiesId := ctx.Params("inabilityId")

	err := DeleteInabilityById(*db, inabilitiesId)
	if err != nil {
		return err
	}

	return ctx.SendStatus(fiber.StatusNoContent)

}
