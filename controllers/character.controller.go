package controllers

import (
	"database/sql"

	"github.com/Masterminds/squirrel"
	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"
)

type CharacterController struct {
	DB *sql.DB
}

func (characterController *CharacterController) CreateCharacter(ctx *fiber.Ctx) error {

	// get user id & character name from body
	var userDetails struct {
		Name   string `json:"name"`
		UserId string `json:"userId"`
	}
	if err := ctx.BodyParser(&userDetails); err != nil {
		return ctx.Status(fiber.StatusBadRequest).SendString("Incorrect Body")
	}

	// insert character into db
	newId := uuid.New().String()
	query, args, err := squirrel.
		Insert("characters").
		Columns("id", "name", "user_id").
		Values(newId, userDetails.Name, userDetails.UserId).
		ToSql()
	if err != nil {
		return err
	}

	_, err = characterController.DB.Exec(query, args...)
	if err != nil {
		return err
	}

	// return character to user
	return ctx.Status(fiber.StatusCreated).JSON(fiber.Map{
		"id": newId,
	})
}

func (characterController *CharacterController) GetCharacterById(ctx *fiber.Ctx) error {
	return ctx.Status(fiber.StatusOK).JSON(nil)
}

// get characters by userId

// update character

// delete character
