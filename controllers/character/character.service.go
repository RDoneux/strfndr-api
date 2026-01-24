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
		Select("cs.id", "name", "category", "description", "attack_modifier", "armour_modifier", "cost", "type").
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

func GetCharacterIdByCharacterSkillId(db sqlx.DB, characterSkillId string) (string, error) {

	query, args, err := squirrel.
		Select("c.id").
		From("character_skills cs").
		Join("characters c ON c.id = cs.character_id").
		Where("cs.id = ?", characterSkillId).
		ToSql()
	if err != nil {
		return "", err
	}

	var props struct {
		ID string `db:"id"`
	}
	err = db.Get(&props, query, args...)
	if err != nil {
		return "", err
	}

	return props.ID, nil

}

func GetCharacterIdByCharacterInabilityId(db sqlx.DB, characterInabilityId string) (string, error) {

	query, args, err := squirrel.
		Select("c.id").
		From("character_inabilities ci").
		Join("characters c ON c.id = ci.character_id").
		Where("ci.id = ?", characterInabilityId).
		ToSql()
	if err != nil {
		return "", err
	}

	var props struct {
		ID string `db:"id"`
	}
	err = db.Get(&props, query, args...)
	if err != nil {
		return "", err
	}

	return props.ID, nil

}

func GetCharacterIdByCharacterItemId(db sqlx.DB, characterItemId string) (string, error) {

	query, args, err := squirrel.
		Select("c.id").
		From("character_items ci").
		Join("characters c ON c.id = ci.character_id").
		Where("ci.id = ?", characterItemId).
		ToSql()
	if err != nil {
		return "", err
	}

	var props struct {
		ID string `db:"id"`
	}
	err = db.Get(&props, query, args...)
	if err != nil {
		return "", err
	}

	return props.ID, nil

}

func GetCharacterIdByCharacterWornItemId(db sqlx.DB, characterWornItemId string) (string, error) {

	query, args, err := squirrel.
		Select("c.id").
		From("character_worn_items cwi").
		Join("characters c ON c.id = cwi.character_id").
		Where("cwi.id = ?", characterWornItemId).
		ToSql()
	if err != nil {
		return "", err
	}

	var props struct {
		ID string `db:"id"`
	}
	err = db.Get(&props, query, args...)
	if err != nil {
		return "", err
	}

	return props.ID, nil

}

func GetCharacterInabilities(db sqlx.DB, characterId string) ([]models.Inability, error) {

	query, args, err := squirrel.
		Select("ci.id", "name", "description").
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
		Select("ci.id",
			"i.name",
			"i.item_type",
			"i.description",
			"i.weight",
			"i.price",
			"ci.quantity",
			"JSON_ARRAYAGG(iel.equip_location) AS equip_locations").
		From("character_items ci").
		Join("items i ON ci.item_id = i.id").
		Join("item_equip_locations iel ON iel.item_id = i.id").
		Where("ci.character_id = ?", characterId).
		GroupBy("ci.id",
			"i.name",
			"i.description",
			"i.weight",
			"i.price",
			"i.item_type",
			"ci.quantity").
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
		Select("i.id",
			"i.name",
			"i.item_type",
			"i.description",
			"i.weight",
			"i.price",
			"cwi.location as equipped_at",
			"ci.quantity",
			"JSON_ARRAYAGG(iel.equip_location) AS equip_locations").
		From("character_worn_items cwi").
		Join("character_items ci ON cwi.character_items_id = ci.id").
		Join("items i ON ci.item_id = i.id").
		Join("item_equip_locations iel ON iel.item_id = i.id").
		Where("cwi.character_id = ?", characterId).
		GroupBy("ci.id",
			"i.name",
			"i.description",
			"i.weight",
			"i.price",
			"i.item_type",
			"ci.quantity").
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

func GetCharacterItemById(db sqlx.DB, characterItemId string) (models.Item, error) {

	query, args, err := squirrel.
		Select("i.id",
			"i.name",
			"i.item_type",
			"i.description",
			"i.weight",
			"i.price",
			"ci.quantity",
			"JSON_ARRAYAGG(iel.equip_location) AS equip_locations").
		From("character_items ci").
		Join("items i ON ci.item_id = i.id").
		Join("item_equip_locations iel ON iel.item_id = i.id").
		GroupBy("ci.id",
			"i.name",
			"i.description",
			"i.weight",
			"i.price",
			"i.item_type",
			"ci.quantity").
		ToSql()
	if err != nil {
		return models.Item{}, err
	}

	var item models.Item
	err = db.Get(&item, query, args...)
	if err != nil {
		return models.Item{}, err
	}

	return item, nil

}

func InsertCharacterSkill(db sqlx.DB, characterId, skillId string) error {

	query, params, err := squirrel.
		Insert("character_skills").
		Columns("character_id", "skill_id").
		Values(characterId, skillId).
		ToSql()
	if err != nil {
		return err
	}

	_, err = db.Exec(query, params...)
	if err != nil {
		return err
	}

	return nil

}

func DeleteCharacterSkill(db sqlx.DB, characterSkillId string) error {

	// delete character
	query, args, err := squirrel.
		Delete("character_skills").
		Where("id = ?", characterSkillId).
		ToSql()
	if err != nil {
		return err
	}

	_, err = db.Exec(query, args...)
	if err != nil {
		return err
	}

	return nil

}

func InsertCharacterInability(db sqlx.DB, characterId, inabilityId string) error {

	query, args, err := squirrel.
		Insert("character_inabilities").
		Columns("character_id", "inability_id").
		Values(characterId, inabilityId).
		ToSql()
	if err != nil {
		return err
	}

	_, err = db.Exec(query, args...)
	if err != nil {
		return err
	}

	return nil

}

func DeleteCharacterInability(db sqlx.DB, characterInabilityId string) error {

	query, args, err := squirrel.
		Delete("character_inabilities ci").
		Where("ci.id = ?", characterInabilityId).
		ToSql()
	if err != nil {
		return err
	}

	_, err = db.Exec(query, args...)
	if err != nil {
		return err
	}

	return nil

}

func InsertCharacterItem(db sqlx.DB, characterId, itemId string) error {

	query, args, err := squirrel.
		Insert("character_items").
		Columns("character_id", "item_id").
		Values(characterId, itemId).
		ToSql()
	if err != nil {
		return err
	}

	_, err = db.Exec(query, args...)
	if err != nil {
		return err
	}

	return nil

}

func DeleteCharacterItem(db sqlx.DB, characterItemId string) error {

	query, args, err := squirrel.
		Delete("character_items ci").
		Where("ci.id = ?", characterItemId).
		ToSql()
	if err != nil {
		return err
	}

	_, err = db.Exec(query, args...)
	if err != nil {
		return err
	}

	return nil

}

func UpdateCharacterBackground(db sqlx.DB, characterBackground models.CharacterBackground) error {

	query, args, err := squirrel.
		Update("character_backgrounds").
		Set("name", characterBackground.CBName).
		Set("description", characterBackground.Description).
		Where("character_id = ?", characterBackground.CBCharacterId).
		ToSql()
	if err != nil {
		return err
	}

	_, err = db.Exec(query, args...)
	if err != nil {
		return err
	}

	return nil

}

func GetCharacterBackground(db sqlx.DB, characterBackgroundId string) (models.CharacterBackground, error) {

	query, args, err := squirrel.
		Select("character_id", "name", "description").
		From("character_backgrounds").
		Where("character_id = ?", characterBackgroundId).
		ToSql()
	if err != nil {
		return models.CharacterBackground{}, err
	}

	var characterBackground models.CharacterBackground
	err = db.Get(&characterBackground, query, args...)
	if err != nil {
		return models.CharacterBackground{}, err
	}

	return characterBackground, nil
}

func InsertCharacterWornItem(db sqlx.DB, characterId, characterItemId string, location models.EquipLocation) error {

	query, args, err := squirrel.
		Insert("character_worn_items").
		Columns("character_id", "character_items_id", "location").
		Values(characterId, characterItemId, location).
		ToSql()
	if err != nil {
		return err
	}

	_, err = db.Exec(query, args...)
	if err != nil {
		return err
	}

	return nil

}

func DeleteCharacterWornItem(db sqlx.DB, characterWornItemId string) error {

	query, args, err := squirrel.
		Delete("character_worn_items cwi").
		Where("cwi.id = ?", characterWornItemId).
		ToSql()
	if err != nil {
		return err
	}

	_, err = db.Exec(query, args...)
	if err != nil {
		return err
	}

	return nil

}

func GetCharacterPools(db sqlx.DB, characterId string) (models.CharacterPool, error) {

	query, args, err := squirrel.
		Select("*").
		From("character_pools").
		Where("character_id = ?", characterId).
		ToSql()
	if err != nil {
		return models.CharacterPool{}, err
	}

	var characterPool models.CharacterPool
	err = db.Get(&characterPool, query, args...)
	if err != nil {
		return models.CharacterPool{}, err
	}

	return characterPool, nil

}
