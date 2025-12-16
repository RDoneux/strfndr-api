package services

import (
	"github.com/golang-migrate/migrate/v4"
	"github.com/rdoneux/strfndr-api/config"
	_ "github.com/golang-migrate/migrate/v4/database/mysql"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	_ "github.com/go-sql-driver/mysql"
)

func RunMigrations() error {
	return runMigrations("up")
}

func RollbackMigrations() error {
	return runMigrations("down")
}

func runMigrations(direction string) error {

	connectionString, err := config.GetDatabaseConfig().ConnectionString()
	if err != nil {
		return err
	}

	migration, err := migrate.New(
		"file://migrations",
		"mysql://" + connectionString,
	)
	if err != nil {
		return err
	}

	switch direction {
	case "up":
		return migration.Up()
	case "down":
		return migration.Down()
	default:
		return migration.Up()
	}

}