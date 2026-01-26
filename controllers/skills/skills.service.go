package skills

import (
	"github.com/Masterminds/squirrel"
	"github.com/jmoiron/sqlx"

	"github.com/rdoneux/nmna-api/models"
)

func GetSkillById(db sqlx.DB, skillId string) (models.Skill, error) {

	query, args, err := squirrel.
		Select("*").
		From("skills").
		Where("id = ?", skillId).
		ToSql()
	if err != nil {
		return models.Skill{}, err
	}

	var skill models.Skill
	err = db.Get(&skill, query, args...)
	if err != nil {
		return models.Skill{}, err
	}

	return skill, nil

}

func InsertSKill(db sqlx.DB, skill *models.Skill) error {

	query, args, err := squirrel.
		Insert("skills").
		Columns("id", "name", "category", "description", "attack_modifier", "armour_modifier", "cost", "type").
		Values(skill.ID, skill.Name, skill.Category, skill.Description, skill.ArmourModifier, skill.ArmourModifier, skill.Cost, skill.Type).
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

func UpdateSkillById(db sqlx.DB, skill *models.Skill) error {

	query, args, err := squirrel.
		Update("skills").
		Set("name", skill.Name).
		Set("category", skill.Category).
		Set("description", skill.Description).
		Set("attack_modifier", skill.AttackModifier).
		Set("armour_modifier", skill.ArmourModifier).
		Set("cost", skill.Cost).
		Set("type", skill.Type).
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

func DeleteSkillById(db sqlx.DB, skillId string) error {

	query, args, err := squirrel.
		Delete("skills").
		Where("id = ?", skillId).
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
