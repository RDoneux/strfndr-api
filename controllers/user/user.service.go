package user

import (
	"database/sql"
	"errors"

	"github.com/Masterminds/squirrel"
	"github.com/jmoiron/sqlx"
	"github.com/rdoneux/nmna-api/models"
)

func GetUserByUsername(db sqlx.DB, username string) (models.PublicUser, error) {

	query, args, err := squirrel.
		Select("id", "display_name", "username").
		From("users").
		Where("username = ?", username).
		ToSql()
	if err != nil {
		return models.PublicUser{}, err
	}

	var user models.PublicUser
	err = db.Get(&user, query, args...)
	if err == sql.ErrNoRows {
		return models.PublicUser{}, errors.New("user not found")
	}
	if err != nil {
		return models.PublicUser{}, err
	}

	return user, nil

}
