package authorisation

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gofiber/fiber/v2"
	"github.com/stretchr/testify/assert"
)

func TestGetUsers(t *testing.T) {

	app := fiber.New()
	authorisationController := &AuthorisationController{
		// need to mock the sqlite db here
	}
	app.Get("/signin", authorisationController.SignIn)

	req := httptest.NewRequest(http.MethodGet, "/signin", nil)
	resp, _ := app.Test(req)

	assert.Equal(t, http.StatusOK, resp.StatusCode)

}
