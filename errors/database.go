package errors

import (
	"github.com/gofiber/fiber/v2"
)

var DatabaseNotOnContextObject = fiber.NewError(500, "database is not available on context object")