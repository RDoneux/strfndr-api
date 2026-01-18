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
	query, args, err := squirrel.
		Select("id", "display_name", "username").
		From("users").ToSql()
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
		if err := rows.Scan(&user.ID, &user.DisplayName, &user.Username); err != nil {
			return err
		}
		users = append(users, user)
	}

	return ctx.Status(fiber.StatusOK).JSON(users)
}

func (usersController *UsersController) GetUserById(ctx *fiber.Ctx) error {

	// get id from path param
	userId := ctx.Params("id")

	// get user from db
	query, args, err := squirrel.
		Select("id", "display_name", "username").
		From("users").
		Where("id = ?", userId).
		ToSql()
	if err != nil {
		return err
	}

	var foundUser models.PublicUser
	err = usersController.DB.QueryRow(query, args...).Scan(&foundUser.ID, &foundUser.DisplayName, &foundUser.Username)
	if err == sql.ErrNoRows {
		return ctx.Status(fiber.StatusNotFound).SendString("User not found")
	}
	if err != nil {
		return err
	}

	// return user info
	return ctx.Status(fiber.StatusOK).JSON(foundUser)

}

func (usersController *UsersController) GetUserByUsername(ctx *fiber.Ctx) error {

	// get username from query params
	username := ctx.Query("username")
	if username == "" {
		return ctx.Status(fiber.StatusBadRequest).SendString("Missing username")
	}

	// select user from db
	query, args, err := squirrel.
		Select("id", "display_name", "username").
		From("users").
		Where("username = ?", username).
		ToSql()
	if err != nil {
		return err
	}

	var user models.PublicUser
	err = usersController.DB.QueryRow(query, args...).Scan(&user.ID, &user.DisplayName, &user.Username)
	if err == sql.ErrNoRows {
		return ctx.Status(fiber.StatusNotFound).SendString("User not found")
	}
	if err != nil {
		return err
	}

	// return user to user
	return ctx.Status(fiber.StatusOK).JSON(user);

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

	// generate tokens
	accessToken, refreshToken, err := services.GenerateJWT(user.Username)
	if err != nil {
		return err
	}
	hashedRefreshToken, err := services.HashTokenForStorage(refreshToken)
	if err != nil {
		return err
	}

	// Build insert query
	query, args, err := squirrel.
		Insert("users").
		Columns("display_name", "username", "password_hash", "refresh_token_hash").
		Values(user.DisplayName, user.Username, user.Password, hashedRefreshToken).
		ToSql()
	if err != nil {
		return err
	}

	// Execute insert query
	_, err = usersController.DB.Exec(query, args...)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusCreated).JSON(fiber.Map{
		"accessToken":  accessToken,
		"refreshToken": refreshToken,
	})

}

func (usersController *UsersController) UpdateUser(ctx *fiber.Ctx) error {

	// get path param
	userId := ctx.Params("id")

	// get request body
	var user models.User
	if err := ctx.BodyParser(&user); err != nil {
		return err
	}

	// hash password
	hashedPassword, err := services.Encrypt(user.Password)
	if err != nil {
		return err
	}

	// update user in db
	query, args, err := squirrel.
		Update("users").
		Set("display_name", user.DisplayName).
		Set("username", user.Username).
		Set("password_hash", hashedPassword).
		Where("id = ?", userId).
		ToSql()
	_, err = usersController.DB.Exec(query, args...)
	if err != nil {
		return err
	}

	// fetch updated user from db
	query, args, err = squirrel.
		Select("id", "display_name", "username").
		From("users").
		Where("id = ?", userId).
		ToSql()

	var updatedUser models.PublicUser
	err = usersController.DB.
		QueryRow(query, args...).
		Scan(&updatedUser.ID, &updatedUser.DisplayName, &updatedUser.Username)
	if err != nil {
		return err
	}

	// generate new tokens
	authToken, refreshToken, err := services.GenerateJWT(updatedUser.Username)
	if err != nil {
		return err
	}

	// update password hash
	err = services.UpdateRefreshTokenHashForUser(refreshToken, updatedUser.Username, usersController.DB)

	// return tokens to user
	return ctx.Status(fiber.StatusOK).JSON(fiber.Map{
		"authToken": authToken,
		"refreshToken": refreshToken,
	})

}

func (usersController *UsersController) DeleteUser(ctx *fiber.Ctx) error {

	// get id from params
	userId := ctx.Params("id")

	// remove user from db
	query, args, err := squirrel.
		Delete("users").
		Where("id = ?", userId).
		ToSql()
	if err != nil {
		return err
	}
	_, err = usersController.DB.Exec(query, args...)

	// return status code 
	return ctx.Status(fiber.StatusNoContent).Send(nil);

}
