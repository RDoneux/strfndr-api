package controllers

import (
	"database/sql"

	"github.com/Masterminds/squirrel"
	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"
	"github.com/rdoneux/nmna-api/models"
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

	// insert character pools
	query, args, err = squirrel.
		Insert("character_pools").
		Columns("character_id").
		Values(newId).
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

	// get id from params
	characterId := ctx.Params("id")

	// select character from db
	query, args, err := squirrel.
		Select("c.id", "c.name", "c.shins", "c.experience_points", "c.tier", "c.user_id", "cp.*").
		From("characters c").
		Where("c.id = ?", characterId).
		Join("character_pools cp ON c.id = cp.character_id").
		ToSql()
	if err != nil {
		return err
	}

	var character models.Character
	err = characterController.DB.QueryRow(query, args...).
		Scan(&character.ID, &character.Name, &character.Shins, &character.ExperiencePoints, &character.Tier, &character.UserId)
	if err != nil {
		return err
	}

	// return character to user
	return ctx.Status(fiber.StatusOK).JSON(character)
}

func (characterController *CharacterController) GetCharactersByUserId(ctx *fiber.Ctx) error {

	// get user id from params
	userId := ctx.Params("id")

	// query all characters associated with the user
	query, args, err := squirrel.
		Select("characters.id", "characters.name", "characters.shins", "characters.experience_points", "characters.tier", "characters.user_id").
		From("users").
		Join("characters ON users.id = characters.user_id").
		Where("users.id = ?", userId).
		ToSql()
	if err != nil {
		return err
	}

	rows, err := characterController.DB.Query(query, args...)
	var characters []models.Character = make([]models.Character, 0)
	for rows.Next() {
		var character models.Character;
		if err := rows.Scan(&character.ID, &character.Name, &character.Shins, &character.ExperiencePoints, &character.Tier, &character.UserId); err != nil {
			return err
		}
		characters = append(characters, character)
	}

	// return characters to user
	return ctx.Status(fiber.StatusOK).JSON(characters)

}

// update character


// delete character
