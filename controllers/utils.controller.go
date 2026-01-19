package controllers

import (
	"fmt"
	"github.com/jmoiron/sqlx"

	"github.com/gofiber/fiber/v2"

	"github.com/Masterminds/squirrel"
	"github.com/rdoneux/nmna-api/models"
)

type UtilsController struct {
	DB *sqlx.DB
}

func (utilsController *UtilsController) GetHealth(ctx *fiber.Ctx) error {
	
	// --- CHECK DB CONNECTION --- //
	if err := utilsController.DB.Ping(); err != nil {
		fmt.Println("DB Ping error: ", utilsController.DB, err)
		return ctx.Status(500).JSON(models.HealthStatus{
			Status:  models.STATUS_DOWN,
			Message: "Unable to make DB connection",
		})
	}

	// --- GET DB NAME --- //
	query, args, err := squirrel.Select("DATABASE()").ToSql()
	if err != nil {
		return ctx.Status(500).JSON(models.HealthStatus{
			Status:  models.STATUS_DOWN,
			Message: "Unable to query database",
		})
	}
	row := utilsController.DB.QueryRow(query, args...)
	var dbName string
	if err := row.Scan(&dbName); err != nil {
		return ctx.Status(500).JSON(models.HealthStatus{
			Status:  models.STATUS_DOWN,
			Message: "Unable to get database name",
		})
	}

	return ctx.Status(200).JSON(models.HealthStatus{
		Status:   models.STATUS_UP,
		Message:  "Service is healthy",
		Database: dbName,
	})

}