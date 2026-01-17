package main

import (
	"github.com/gofiber/fiber/v2"
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

	utilsController := &controllers.UtilsController{
		DB: database,
	}

	usersController := &controllers.UsersController{
		DB: database,
	}

	// utils
	app.Get("/health", utilsController.GetHealth)

	// users
	app.Get("/users", usersController.GetUsers)
	app.Post("/users", usersController.CreateUser)

	app.Listen(":3000");

}