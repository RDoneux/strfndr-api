package character

import (
	"github.com/Masterminds/squirrel"
	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"
	"github.com/jmoiron/sqlx"
	"github.com/rdoneux/nmna-api/models"
)

type CharacterController struct {
	DB *sqlx.DB
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

	// insert character backgrounds
	query, args, err = squirrel.
		Insert("character_backgrounds").
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
	db := characterController.DB

	// select character from db
	character, err := GetCharacterById(*db, characterId)
	if err != nil {
		return err
	}

	// fetch the character's skills separately
	skills, err := GetCharacterSkills(*db, characterId)
	if err != nil {
		return err
	}

	// fetch the characters' inabilities separately
	inabilities, err := GetCharacterInabilities(*db, characterId)
	if err != nil {
		return err
	}

	// fetch character items
	items, err := GetCharacterItems(*db, characterId)
	if err != nil {
		return err
	}

	// fetch character worn items
	wornItems, err := GetCharacterWornItems(*db, characterId)
	if err != nil {
		return err
	}

	character.CharacterSkills = skills
	character.CharacterInabilities = inabilities
	character.CharacterItems = items
	character.CharacterWornItems = wornItems

	// return character to user
	return ctx.Status(fiber.StatusOK).JSON(character.ToNested())
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
		var character models.Character
		if err := rows.Scan(&character.ID, &character.Name, &character.Shins, &character.ExperiencePoints, &character.Tier, &character.UserId); err != nil {
			return err
		}
		characters = append(characters, character)
	}

	// return characters to user
	return ctx.Status(fiber.StatusOK).JSON(characters)

}

func (characterController *CharacterController) AddCharacterSkill(ctx *fiber.Ctx) error {

	// get skill id from body
	db := characterController.DB
	var params struct {
		SkillID     string `json:"skillId"`
		CharacterId string `json:"characterId"`
	}
	if err := ctx.BodyParser(&params); err != nil {
		return err
	}

	// construct insert statement
	err := InsertCharacterSkill(*db, params.CharacterId, params.SkillID)
	if err != nil {
		return err
	}

	// get character skills
	skills, err := GetCharacterSkills(*db, params.CharacterId)
	if err != nil {
		return err
	}

	// return skills to user
	return ctx.Status(fiber.StatusCreated).JSON(skills);

}

// update character

// delete character
