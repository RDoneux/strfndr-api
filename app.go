package main

import (
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/jwt/v3"
	"github.com/jmoiron/sqlx"
	"github.com/joho/godotenv"
	"github.com/rdoneux/nmna-api/services"
	"os"

	"github.com/rdoneux/nmna-api/controllers"
	"github.com/rdoneux/nmna-api/controllers/character"
	"github.com/rdoneux/nmna-api/controllers/user"
)

func main() {

	if err := godotenv.Load(); err != nil {
		panic("Error loading .env file")
	}

	db, err := services.ConnectDatabase()
	if err != nil {
		panic(err)
	}
	database := sqlx.NewDb(db, "mysql")

	err = services.RunMigrations()
	if err != nil {
		panic(err)
	}

	app := fiber.New()

	var jwtSecret = []byte(os.Getenv("JWT_SECRET"))
	app.Use("/protected", jwtware.New(jwtware.Config{
		SigningKey:  jwtSecret,
		ContextKey:  "user",
		TokenLookup: "header:Authorization",
		AuthScheme:  "Bearer",
	}))

	utilsController := &controllers.UtilsController{
		DB: database,
	}

	authController := &controllers.AuthorisationController{
		DB: database,
	}

	usersController := &user.UsersController{
		DB: database,
	}

	characterController := &character.CharacterController{
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

	// characters
	app.Get("/protected/character/:id", characterController.GetCharacterById)
	app.Get("/protected/characters/user/:id", characterController.GetCharactersByUserId)
	app.Post("/protected/characters", characterController.CreateCharacter)
	app.Put("/protected/characters/skill", characterController.AddCharacterSkill)
	app.Delete("/protected/characters/skill/:characterSkillId", characterController.RemoveCharacterSkill)
	app.Put("/protected/characters/inability", characterController.AddCharacterInability)
	app.Delete("/protected/characters/inability/:characterInabilityId", characterController.RemoveCharacterInability)
	app.Put("/protected/characters/item", characterController.AddCharacterItem)
	app.Delete("/protected/characters/item/:characterItemId", characterController.RemoveCharacterItem)
	app.Put("/protected/characters/background/:characterId", characterController.UpdateCharacterBackground)
	app.Put("/protected/characters/worn-items", characterController.AddCharacterWornItem)
	app.Delete("/protected/characters/worn-items/:characterWornItemId", characterController.RemoveCharacterWornItem)
	app.Put("/protected/characters/pool/:characterId", characterController.UpdateCharacterPool)
	app.Put("/protected/characters/info/:characterId", characterController.UpdateCharacterInformation)

	app.Listen(":3000")

}
