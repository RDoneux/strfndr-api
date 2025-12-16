package main

import (
	"github.com/rdoneux/strfndr-api/services"
	"github.com/joho/godotenv"
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


	services.RollbackMigrations();
	defer database.Close()

}