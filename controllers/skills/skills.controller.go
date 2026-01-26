package skills

import (
	"github.com/Masterminds/squirrel"
	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"
	"github.com/jmoiron/sqlx"
	"github.com/rdoneux/nmna-api/models"
	"github.com/rdoneux/nmna-api/services"
)

type SkillsController struct {
	DB *sqlx.DB
}

func (skillsController *SkillsController) GetSkillById(ctx *fiber.Ctx) error {

	db := skillsController.DB
	skillId := ctx.Params("skillId")

	skill, err := GetSkillById(*db, skillId)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(skill)

}

func (skillsController *SkillsController) FindSkillByQuery(ctx *fiber.Ctx) error {

	db := skillsController.DB

	queryName := ctx.Query("name")
	queryCategory := ctx.Query("category")
	queryType := ctx.Query("type")

	search := squirrel.
		Select("id",
			"name",
			"description",
			"category",
			"attack_modifier",
			"armour_modifier",
			"cost",
			"type").
		From("skills")

	if queryName != "" {
		search = search.Where("name LIKE ?", "%"+queryName+"%")
	}

	if queryCategory != "" {
		search = search.Where("category = ?", queryCategory)
	}

	if queryType != "" {
		search = search.Where("type = ?", queryType)
	}

	query, args, err := search.ToSql()
	if err != nil {
		return err
	}

	var skills []models.ListSkill = make([]models.ListSkill, 0)
	err = db.Select(&skills, query, args...)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(skills)

}

func (skillsController *SkillsController) CreateSkill(ctx *fiber.Ctx) error {

	db := skillsController.DB
	id := uuid.New().String()

	var skill models.Skill
	err := ctx.BodyParser(&skill)
	skill.ID = id
	if err != nil {
		return err
	}

	err = InsertSKill(*db, &skill)
	if err != nil {
		return err
	}

	insertedSkill, err := GetSkillById(*db, skill.ID)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusCreated).JSON(insertedSkill)

}

func (skillsController *SkillsController) UpdateSkill(ctx *fiber.Ctx) error {

	db := skillsController.DB
	id := ctx.Params("skillId")

	var skill models.Skill
	err := ctx.BodyParser(&skill)
	if err != nil {
		return err
	}

	err = UpdateSkillById(*db, &skill)
	if err != nil {
		return err
	}

	updatedSkill, err := GetSkillById(*db, id)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(updatedSkill)

}

func (skillsController *SkillsController) DeleteSkill(ctx *fiber.Ctx) error {

	db := skillsController.DB
	id := ctx.Params("skillId")

	err := DeleteSkillById(*db, id)
	if err != nil {
		return err
	}

	return ctx.SendStatus(fiber.StatusNoContent)

}

func (skillsController *SkillsController) GetSkillCategories(ctx *fiber.Ctx) error {

	db := skillsController.DB
	skillCategories, err := services.GetEnumValue(*db, "skills", "category")
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(skillCategories)

}

func (skillsController *SkillsController) GetSkillTypes(ctx *fiber.Ctx) error {

	db := skillsController.DB
	skillTypes, err := services.GetEnumValue(*db, "skills", "type")
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(skillTypes)

}
