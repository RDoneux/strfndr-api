package main

import (
	"os"
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/jwt/v3"
	"github.com/joho/godotenv"
	"github.com/rdoneux/nmna-api/services"

	"github.com/rdoneux/nmna-api/controllers"
)

func main() {

	if err := godotenv.Load(); err != nil {
		panic("Error loading .env file")
	}
	
	database, err := services.ConnectDatabase()
	if err != nil {
		panic(err)
	}

	err = services.RunMigrations()
	if err != nil {
		panic(err)
	}

	app := fiber.New()

	var jwtSecret = []byte(os.Getenv("JWT_SECRET"))
	app.Use("/protected", jwtware.New(jwtware.Config{
		SigningKey: jwtSecret,
		ContextKey: "user",
		TokenLookup: "header:Authorization",
		AuthScheme: "Bearer",
	}))

	utilsController := &controllers.UtilsController{
		DB: database,
	}

	authController := &controllers.AuthorisationController{
		DB: database,
	}

	usersController := &controllers.UsersController{
		DB: database,
	}

	// utils
	app.Get("/health", utilsController.GetHealth)

	// authorisation
	app.Get("/refresh", authController.RefreshToken)
	app.Get("/login", authController.SignIn)

	// users
	app.Get("/protected/users", usersController.GetUsers)
	app.Get("/protected/user/:id", usersController.GetUserById)
	app.Get("/protected/user", usersController.GetUserByUsername)
	app.Post("/users", usersController.CreateUser)
	app.Put("/protected/users/:id", usersController.UpdateUser)
	app.Delete("/protected/users/:id", usersController.DeleteUser)

	app.Listen(":3000");

}