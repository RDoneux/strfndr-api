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
