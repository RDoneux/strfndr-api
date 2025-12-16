package services

import (
	"database/sql"
	"fmt"
	"github.com/rdoneux/strfndr-api/config"
	_ "github.com/go-sql-driver/mysql"
)

func ConnectDatabase() (*sql.DB, error) {

	connectionString, err := config.GetDatabaseConfig().ConnectionString()
	if err != nil {
		return nil, err
	}

	fmt.Println("Connecting to database at host: ", connectionString)

	db, error := sql.Open("mysql", connectionString)

	if error != nil {
		return nil, error
	}

	// Verify Connection
	if err := db.Ping(); err != nil {
		return nil, err
	}

	fmt.Println("Database connection established")
	return db, nil

}
