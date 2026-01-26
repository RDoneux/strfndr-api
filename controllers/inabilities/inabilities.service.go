package inabilities

import (
	"github.com/Masterminds/squirrel"
	"github.com/jmoiron/sqlx"
	"github.com/rdoneux/nmna-api/models"
)

func GetInabilityById(db sqlx.DB, inabilityId string) (models.Inability, error) {

	query, args, err := squirrel.
		Select("*").
		From("inabilities").
		Where("id = ?", inabilityId).
		ToSql()
	if err != nil {
		return models.Inability{}, err
	}

	var inability models.Inability
	err = db.Get(&inability, query, args...)
	if err != nil {
		return models.Inability{}, err
	}

	return inability, nil

}

func InsertInability(db sqlx.DB, inability models.Inability) error {

	query, args, err := squirrel.
		Insert("inabilities").
		Columns("id", "name", "description").
		Values(inability.ID, inability.Name, inability.Description).
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

func UpdateInability(db sqlx.DB, inability models.Inability, inabilityId string) error {

	query, args, err := squirrel.
		Update("inabilities").
		Set("name", inability.Name).
		Set("description", inability.Description).
		Where("id = ?", inabilityId).
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

func DeleteInabilityById(db sqlx.DB, inabilityId string) error {

	query, args, err := squirrel.
		Delete("inabilities").
		Where("id = ?", inabilityId).
		ToSql()
	if err != nil {
		return nil
	}

	_, err = db.Exec(query, args...)
	if err != nil {
		return err
	}

	return nil

}