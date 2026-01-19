package character

import (
	"github.com/Masterminds/squirrel"
	"github.com/jmoiron/sqlx"
	"github.com/rdoneux/nmna-api/models"
)

func GetCharacterById(db sqlx.DB, characterId string) (models.Character, error) {

	query, args, err := squirrel.
		Select("c.id", "c.name", "c.shins", "c.experience_points", "c.tier", "c.user_id", "cp.*", "cb.*").
		From("characters c").
		Join("character_pools cp ON c.id = cp.character_id").
		LeftJoin("character_backgrounds cb ON c.id = cb.character_id").
		Where("c.id = ?", characterId).
		ToSql()
	if err != nil {
		return models.Character{}, err
	}

	var character models.Character
	err = db.Get(&character, query, args...)
	if err != nil {
		return models.Character{}, err
	}

	return character, nil
}

func GetCharacterSkills(db sqlx.DB, characterId string) ([]models.Skill, error) {

	query, args, err := squirrel.
		Select("name", "category", "description", "attack_modifier", "armour_modifier", "cost", "type").
		From("character_skills cs").
		Join("skills s ON cs.skill_id = s.id").
		Where("cs.character_id = ?", characterId).
		ToSql()
	if err != nil {
		return nil, err
	}

	var skills []models.Skill = make([]models.Skill, 0)
	err = db.Select(&skills, query, args...)
	if err != nil {
		return nil, err
	}

	return skills, nil

}

func GetCharacterInabilities(db sqlx.DB, characterId string) ([]models.Inability, error) {

	query, args, err := squirrel.
		Select("name", "description").
		From("character_inabilities ci").
		Join("inabilities i ON ci.inability_id = i.id").
		Where("ci.character_id = ?", characterId).
		ToSql()
	if err != nil {
		return nil, err
	}

	var inabilities []models.Inability = make([]models.Inability, 0)
	err = db.Select(&inabilities, query, args...)
	if err != nil {
		return nil, err
	}

	return inabilities, nil

}

func GetCharacterItems(db sqlx.DB, characterId string) ([]models.Item, error) {

	query, args, err := squirrel.
		Select("name", "item_type", "description", "weight", "price", "equip_location").
		From("character_items ci").
		Join("items i ON ci.item_id = i.id").
		Where("ci.character_id = ?", characterId).
		ToSql()
	if err != nil {
		return nil, err
	}

	var items []models.Item = make([]models.Item, 0)
	err = db.Select(&items, query, args...)
	if err != nil {
		return nil, err
	}

	return items, nil

}

func GetCharacterWornItems(db sqlx.DB, characterId string) ([]models.Item, error) {

	query, args, err := squirrel.
		Select("name", "item_type", "description", "weight", "price", "equip_location").
		From("character_worn_items cwi").
		Join("character_items ci ON cwi.character_items_id = ci.id").
		Join("items i ON ci.item_id = i.id").
		Where("cwi.character_id = ?", characterId).
		ToSql()
	if err != nil {
		return nil, err
	}

	var wornItems []models.Item = make([]models.Item, 0)
	err = db.Select(&wornItems, query, args...)
	if err != nil {
		return nil, err
	}

	return wornItems, nil

}
