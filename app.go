package main

import (
	"os"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/jwt/v3"
	"github.com/jmoiron/sqlx"
	"github.com/joho/godotenv"
	"github.com/rdoneux/nmna-api/services"

	"github.com/rdoneux/nmna-api/controllers"
	"github.com/rdoneux/nmna-api/controllers/authorisation"
	"github.com/rdoneux/nmna-api/controllers/character"
	"github.com/rdoneux/nmna-api/controllers/items"
	"github.com/rdoneux/nmna-api/controllers/skills"
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

	authController := &authorisation.AuthorisationController{
		DB: database,
	}

	usersController := &user.UsersController{
		DB: database,
	}

	characterController := &character.CharacterController{
		DB: database,
	}

	itemController := &items.ItemsController {
		DB: database,
	}

	skillController := &skills.SkillsController {
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
	app.Put("/protected/characters/:characterId/skill/:skillId", characterController.AddCharacterSkill)
	app.Put("/protected/characters/:characterId/inability/:inabilityId", characterController.AddCharacterInability)
	app.Put("/protected/characters/:characterId/item/:itemId", characterController.AddCharacterItem)
	app.Put("/protected/characters/:characterId/background", characterController.UpdateCharacterBackground)
	app.Put("/protected/characters/:characterId/worn-items/:characterItemId", characterController.AddCharacterWornItem)
	app.Put("/protected/characters/:characterId/pool", characterController.UpdateCharacterPool)
	app.Put("/protected/characters/:characterId/info", characterController.UpdateCharacterInformation)
	app.Delete("/protected/characters/skill/:characterSkillId", characterController.RemoveCharacterSkill)
	app.Delete("/protected/characters/inability/:characterInabilityId", characterController.RemoveCharacterInability)
	app.Delete("/protected/characters/item/:characterItemId", characterController.RemoveCharacterItem)
	app.Delete("/protected/characters/worn-items/:characterWornItemId", characterController.RemoveCharacterWornItem)
	app.Delete("/protected/characters/:characterId/archive", characterController.ArchiveCharacter)

	// items
	app.Get("/protected/item/:itemId", itemController.GetItemById)
	app.Get("/protected/items", itemController.FindItemsByQuery)
	app.Post("/protected/items", itemController.CreateItem)
	app.Put("/protected/items/:itemId", itemController.UpdateItem)
	app.Delete("/protected/items/:itemId", itemController.DeleteItem)

	app.Get("/items/types", itemController.GetItemTypes)
	app.Get("/items/equip-locations", itemController.GetEquipLocations)
	
	// skills
	app.Get("/protected/skill/:skillId", skillController.GetSkillById)

	app.Listen(":3000")

}
