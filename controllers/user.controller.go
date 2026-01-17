package controllers

import (
	"database/sql"

	"github.com/Masterminds/squirrel"
	"github.com/gofiber/fiber/v2"

	"github.com/rdoneux/nmna-api/models"
	"github.com/rdoneux/nmna-api/services"
)

type UsersController struct {
	DB *sql.DB
}

func (usersController *UsersController) GetUsers(ctx *fiber.Ctx) error {

	// Build query
	query, args, err := squirrel.Select("display_name", "username").From("users").ToSql()
	if err != nil {
		return err
	}

	// Execute query
	rows, err := usersController.DB.Query(query, args...)
	if err != nil {
		return err
	}

	// Populate users array from query response
	var users []models.PublicUser = make([]models.PublicUser, 0)
	for rows.Next() {
		var user models.PublicUser
		if err := rows.Scan(&user.DisplayName, &user.Username); err != nil {
			return err
		}
		users = append(users, user)
	}

	return ctx.Status(200).JSON(fiber.Map{"users": users})
}

func (usersController *UsersController) CreateUser(ctx *fiber.Ctx) error {

	// get username and password from basic auth
	username, password, ok := services.GetBasicAuth(ctx)
	if ok != true {
		return fiber.ErrNotAcceptable
	}

	// encrypt password to be saved
	encryptedPassword, err := services.Encrypt(password)
	if err != nil {
		return fiber.ErrInternalServerError
	}

	// get display name from body
	var body struct {
		DisplayName string `json:"displayName"`
	}
	if err := ctx.BodyParser(&body); err != nil {
		return err
	}

	// construct user
	var user models.User = models.User{
		DisplayName: body.DisplayName,
		Username:    username,
		Password:    encryptedPassword,
	}

	// Build insert query
	query, args, err := squirrel.
		Insert("users").
		Columns("display_name", "username", "password").
		Values(user.DisplayName, user.Username, user.Password).
		ToSql()
	if err != nil {
		return err
	}

	// Execute insert query
	_, err = usersController.DB.Exec(query, args...)
	if err != nil {
		return err
	}

	// get tokens
	accessToken, refreshToken, err := services.GenerateJWT(user.Username)
	if err != nil {
		return err
	}

	return ctx.Status(200).JSON(fiber.Map{
		"accessToken":  accessToken,
		"refreshToken": refreshToken,
	})

}
