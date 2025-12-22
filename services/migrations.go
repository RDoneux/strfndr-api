package services

import (
	"fmt"
	"strconv"
	"strings"

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

	if strings.HasPrefix(migrationErr.Error(), "Dirty database version") {
		fmt.Println("Database is in a dirty state. Attempting to force clean...")

		// Extract version number from error message
		version, err := extractVersionFromDirtyError(migrationErr.Error())
		if err != nil {
			return fmt.Errorf("could not extract version from dirty error: %w", err)
		}

		// Force the database to clean state
		err = forceDatabaseClean(version)
		if err != nil {
			return fmt.Errorf("could not force clean database: %w", err)
		}

		fmt.Println("Database forced to clean state. Retrying migrations...")
		migrationErr = runMigrations("up")
		return migrationErr
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

func extractVersionFromDirtyError(errMsg string) (int, error) {
	// Error format: "Dirty database version 202512181751. Fix and force version."
	parts := strings.Split(errMsg, " ")
	if len(parts) < 4 {
		return 0, fmt.Errorf("unexpected error format: %s", errMsg)
	}

	versionStr := strings.TrimSuffix(parts[3], ".")
	version, err := strconv.Atoi(versionStr)
	if err != nil {
		return 0, fmt.Errorf("could not parse version number: %w", err)
	}

	return version, nil
}

func forceDatabaseClean(version int) error {
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

	fmt.Printf("Forcing database to clean state at version %d\n", version)
	return migration.Force(version)
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
