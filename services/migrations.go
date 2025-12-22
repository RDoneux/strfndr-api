package services

import (
	"fmt"

	_ "github.com/go-sql-driver/mysql"
	"github.com/golang-migrate/migrate/v4"
	_ "github.com/golang-migrate/migrate/v4/database/mysql"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	"github.com/rdoneux/strfndr-api/config"
)

type MigrationResult struct {
	Success bool
	Message string
}

func RunMigrations() error {
	migrationErr := runMigrations("up")
	if migrationErr == migrate.ErrNoChange {
		fmt.Println("No new migrations to apply.")
		return nil
	}

	return migrationErr
}

func RollbackMigrations() error {
	migrationErr := runMigrations("down")
	if migrationErr == migrate.ErrNoChange {
		return nil
	}
	return migrationErr
}

func runMigrations(direction string) error {

	connectionString, err := config.GetDatabaseConfig().ConnectionString()
	if err != nil {
		return err
	}

	migration, err := migrate.New(
		"file://migrations",
		"mysql://"+connectionString,
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
