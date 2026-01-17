package controllers

import (
	"github.com/gofiber/fiber/v2"
)

type SecurityController struct {
}

func (securityController *SecurityController) refreshToken(ctx *fiber.Ctx) error {

	// get the user from the database

	// generate new tokens for that user

	// return access tokens to the user

	return nil
}
