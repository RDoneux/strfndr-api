package services

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"

	_ "github.com/go-sql-driver/mysql"
	"github.com/golang-migrate/migrate/v4"
	_ "github.com/golang-migrate/migrate/v4/database/mysql"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	"github.com/rdoneux/nmna-api/config"
)

const ROOT_MIGRATIONS_PATH = "migrations"

type MigrationResult struct {
	Success bool
	Message string
}

func RunMigrations() error {
	migrationErr := runMigrations("up", ROOT_MIGRATIONS_PATH)
	if migrationErr == migrate.ErrNoChange {
		fmt.Println("No new migrations to apply.")
		return nil
	}

	return migrationErr
}

func RollbackMigrations() error {
	migrationErr := runMigrations("down", ROOT_MIGRATIONS_PATH)
	if migrationErr == migrate.ErrNoChange {
		return nil
	}
	return migrationErr
}

func runMigrations(direction string, path string) error {
    entries, err := os.ReadDir(path)
    if err != nil {
        return err
    }

    if len(entries) == 0 {
        fmt.Println("No migration files found.")
        return nil
    }

    // First, check if THIS directory contains SQL files
    hasSQLFiles := false
    for _, entry := range entries {
        if !entry.IsDir() && strings.HasSuffix(entry.Name(), ".sql") {
            hasSQLFiles = true
            break
        }
    }

    // If this directory has SQL files, run migrations on it
    if hasSQLFiles {
        connectionString, err := config.GetDatabaseConfig().ConnectionString()
        if err != nil {
            return err
        }

        println("Running migrations in directory:", path)
        migration, err := migrate.New(
            "file://"+path,
            "mysql://"+connectionString,
        )
        if err != nil {
            println("Error:", err.Error())
            return err
        }
        // defer migration.Close()

        switch direction {
        case "up":
            err = migration.Up()
        case "down":
            err = migration.Down()
        default:
            err = migration.Up()
        }

        if err != nil && err != migrate.ErrNoChange {
            println("Migration failed:", err.Error())
            return err
        }
        
        println("Migrations completed in:", path)
    }

    // Then process subdirectories
    for _, entry := range entries {
        if entry.IsDir() && !strings.HasPrefix(entry.Name(), "_") {
            subDir := filepath.Join(path, entry.Name())
            err := runMigrations(direction, subDir)
            if err != nil {
                return err
            }
        }
    }

    return nil
}