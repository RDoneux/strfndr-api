package skills

import (
	"github.com/gofiber/fiber/v2"
	"github.com/jmoiron/sqlx"
)

type SkillsController struct {
	DB *sqlx.DB
}

func (skillsController *SkillsController) GetSkillById (ctx *fiber.Ctx) error {

	db := skillsController.DB
	skillId := ctx.Params("skillId")

	skill, err := GetSkillById(*db, skillId)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(skill)

}