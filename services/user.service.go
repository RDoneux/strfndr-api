package services

import (
	"encoding/base64"
	"strings"

	"github.com/gofiber/fiber/v2"
)

func GetBasicAuth(ctx *fiber.Ctx) (username, password string, ok bool) {

	auth := ctx.Get("Authorization")
	if auth == "" || !strings.HasPrefix(auth, "Basic ") {
		return
	}

	payload, err := base64.StdEncoding.DecodeString(auth[len("Basic "):])
	if err != nil {
		return
	}

	payloadParts := strings.SplitN(string(payload), ":", 2)
	if len(payloadParts) != 2 {
		return
	}

	return payloadParts[0], payloadParts[1], true

}
