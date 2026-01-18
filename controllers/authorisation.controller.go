package controllers

import (
	"crypto/sha256"
	"database/sql"
	"os"

	"github.com/Masterminds/squirrel"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v5"
	"golang.org/x/crypto/bcrypt"

	"github.com/rdoneux/nmna-api/services"
)

type AuthorisationController struct {
	DB *sql.DB
}

func (securityController *AuthorisationController) RefreshToken(ctx *fiber.Ctx) error {

	var jwtSecret = []byte(os.Getenv("JWT_SECRET"))

	// get refresh token claims
	authHeaderPrefix := "Bearer "
	authHeader := ctx.Get("Authorization")
	if authHeader == "" || len(authHeader) < 8 || authHeader[:len(authHeaderPrefix)] != authHeaderPrefix {
		return fiber.ErrForbidden
	}

	tokenString := authHeader[len(authHeaderPrefix):]
	token, jwtErr := jwt.Parse(tokenString, func(token *jwt.Token) (any, error) {
		return jwtSecret, nil
	})
	if jwtErr != nil {
		return jwtErr
	}

	claims, ok := token.Claims.(jwt.MapClaims)
	if !ok {
		return fiber.ErrForbidden
	}

	username := claims["username"].(string)
	tokenType := claims["type"].(string)

	if tokenType != "refresh" {
		return fiber.ErrForbidden
	}

	// get the user & valid refresh token from the database
	query, args, err := squirrel.
		Select("username", "refresh_token_hash").
		From("users").Where("username = ?", username).
		ToSql()
	var dbUsername string
	var dbRefreshTokenHash string
	getUserError := securityController.DB.QueryRow(query, args...).Scan(&dbUsername, &dbRefreshTokenHash)
	if getUserError != nil {
		return fiber.ErrForbidden
	}

	// check the refresh token matches the valid refresh token for the user
	digest := sha256.Sum256([]byte(tokenString))
	if err := bcrypt.CompareHashAndPassword([]byte(dbRefreshTokenHash), digest[:]); err != nil {
		return fiber.ErrForbidden
	}

	// generate new tokens for that user
	accessToken, refreshToken, err := services.GenerateJWT(username)
	if err != nil {
		return err
	}

	services.UpdateRefreshTokenHashForUser(refreshToken, dbUsername, securityController.DB)

	// return access tokens to the user
	return ctx.Status(200).JSON(fiber.Map{
		"accessToken":  accessToken,
		"refreshToken": refreshToken,
	})
}

func (securityController *AuthorisationController) SignIn(ctx *fiber.Ctx) error {

	// get basic auth
	username, password, ok := services.GetBasicAuth(ctx)
	if ok != true {
		return fiber.ErrNotAcceptable
	}

	// find matching user in db
	query, args, err := squirrel.
		Select("username", "password_hash").
		From("users").
		Where("username = ?", username).
		ToSql()
	if err != nil {
		return err
	}

	var dbUsername string
	var dbPasswordHash string
	getUserError := securityController.DB.QueryRow(query, args...).Scan(&dbUsername, &dbPasswordHash)
	if getUserError != nil {
		return getUserError
	}
	if dbUsername == "" || dbPasswordHash == "" {
		return fiber.ErrForbidden
	}

	// compare password
	if err := bcrypt.CompareHashAndPassword([]byte(dbPasswordHash), []byte(password)); err != nil {
		return err
	}

	// generate tokens
	accessToken, refreshToken, err := services.GenerateJWT(dbUsername)
	if err != nil {
		return err
	}

	// update refresh token hash
	services.UpdateRefreshTokenHashForUser(refreshToken, dbUsername, securityController.DB)

	// return tokens to user
	return ctx.Status(200).JSON(fiber.Map{
		"accessToken":  accessToken,
		"refreshToken": refreshToken,
	})

}
