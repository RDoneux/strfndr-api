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
		Columns("character_id", "name", "description").
		Values(newId, "", "").
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
	var characters []any = make([]any, 0)
	for rows.Next() {
		var character models.Character
		if err := rows.Scan(&character.ID, &character.Name, &character.Shins, &character.ExperiencePoints, &character.Tier, &character.UserId); err != nil {
			return err
		}
		characters = append(characters, character.ToList())
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
	return ctx.Status(fiber.StatusCreated).JSON(skills)

}

func (characterController *CharacterController) RemoveCharacterSkill(ctx *fiber.Ctx) error {

	// get props from path
	db := characterController.DB
	characterSkillId := ctx.Params("characterSkillId")

	// get skill to delete - need the characterId
	characterId, err := GetCharacterIdByCharacterSkillId(*db, characterSkillId)
	if err != nil {
		return err
	}

	// delete character skill
	err = DeleteCharacterSkill(*db, characterSkillId)
	if err != nil {
		return err
	}

	// get remaining character skills
	skills, err := GetCharacterSkills(*db, characterId)
	if err != nil {
		return err
	}

	// return to user
	return ctx.Status(fiber.StatusOK).JSON(skills)

}

func (characterController *CharacterController) AddCharacterInability(ctx *fiber.Ctx) error {

	// get props from body
	db := characterController.DB
	var params struct {
		CharacterID string `json:"characterId"`
		InabilityID string `json:"inabilityId"`
	}
	if err := ctx.BodyParser(&params); err != nil {
		return err
	}

	// insert inability
	err := InsertCharacterInability(*db, params.CharacterID, params.InabilityID)
	if err != nil {
		return err
	}

	// get updated inabilities
	inabilities, err := GetCharacterInabilities(*db, params.CharacterID)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(inabilities)

}

func (characterController *CharacterController) RemoveCharacterInability(ctx *fiber.Ctx) error {

	// get id from path
	db := characterController.DB
	inabilityId := ctx.Params("characterInabilityId")

	// getCharacterId from inabilityId table
	characterId, err := GetCharacterIdByCharacterInabilityId(*db, inabilityId)
	if err != nil {
		return err
	}

	// remove inability
	err = DeleteCharacterInability(*db, inabilityId)
	if err != nil {
		return err
	}

	// get updated inabilities
	inabilities, err := GetCharacterInabilities(*db, characterId)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(inabilities)

}

func (characterController *CharacterController) AddCharacterItem(ctx *fiber.Ctx) error {

	db := characterController.DB
	// get params from body
	var params struct {
		CharacterID string `json:"characterId"`
		ItemId      string `json:"itemId"`
	}
	err := ctx.BodyParser(&params)
	if err != nil {
		return err
	}

	// insert item
	err = InsertCharacterItem(*db, params.CharacterID, params.ItemId)
	if err != nil {
		return err
	}

	// get updated items
	items, err := GetCharacterItems(*db, params.CharacterID)
	if err != nil {
		return err
	}

	// return items
	return ctx.Status(fiber.StatusOK).JSON(items)

}

func (characterController *CharacterController) RemoveCharacterItem(ctx *fiber.Ctx) error {

	db := characterController.DB
	// get itemId from path
	itemId := ctx.Params("characterItemId")

	// getCharacterId from characterItem table
	characterId, err := GetCharacterIdByCharacterItemId(*db, itemId)
	if err != nil {
		return err
	}

	// remove characterItem
	err = DeleteCharacterItem(*db, itemId)
	if err != nil {
		return nil
	}

	// get updated items
	items, err := GetCharacterItems(*db, characterId)
	if err != nil {
		return err
	}

	// return items to user
	return ctx.Status(fiber.StatusOK).JSON(items)

}

func (characterController *CharacterController) UpdateCharacterBackground(ctx *fiber.Ctx) error {

	// get character background from body
	db := characterController.DB
	var characterBackground models.CharacterBackground
	err := ctx.BodyParser(&characterBackground)
	if err != nil {
		return err
	}

	// update character background
	err = UpdateCharacterBackground(*db, characterBackground)
	if err != nil {
		return err
	}

	// get updated character background
	updatedCharacterBackground, err := GetCharacterBackground(*db, characterBackground.CBCharacterId)
	if err != nil {
		return err
	}

	// return background
	return ctx.Status(fiber.StatusOK).JSON(updatedCharacterBackground)

}

func (characterController *CharacterController) AddCharacterWornItem(ctx *fiber.Ctx) error {

	// get character item id, character id & location from params
	db := characterController.DB
	var params struct {
		CharacterItemId string               `json:"characterItemId"`
		CharacterId     string               `json:"characterId"`
		Location        models.EquipLocation `json:"location"`
	}
	err := ctx.BodyParser(&params)
	if err != nil {
		return err
	}

	// chack item can be equipped to the desired location
	item, err := GetCharacterItemById(*db, params.CharacterItemId)
	if err != nil {
		return err
	}
	if item.EquipLocation != params.Location {
		return ctx.Status(fiber.StatusConflict).SendString("Item can only be equipped to " + string(item.EquipLocation))
	}

	// insert character worn item
	err = InsertCharacterWornItem(*db, params.CharacterId, params.CharacterItemId, params.Location)
	if err != nil {
		return err
	}

	// get updated worn item
	characterWornItems, err := GetCharacterWornItems(*db, params.CharacterId)
	if err != nil {
		return err
	}

	// return worn items to user
	return ctx.Status(fiber.StatusOK).JSON(characterWornItems)

}

// update character

// delete character
