package models

type SkillCategory string
type SkillType string

const (
	MIGHT           SkillCategory = "Might"
	SPEED           SkillCategory = "Speed"
	INTELECT        SkillCategory = "Intellect"
	SPECIAL_ABILITY SkillCategory = "Special Ability"
	CUSTOM_SKILL    SkillCategory = "Custom Skill"
)

const (
	ACTION                         SkillType = "Action"
	ENABLER                        SkillType = "Enabler"
	DEFENCE                        SkillType = "Defence"
	UTILITY                        SkillType = "Utility"
	PASSIVE                        SkillType = "Passive"
	SKILL_SLOT                     SkillType = "Skill Slot"
	FIGHTING_MOVE_CHOICE_SLOT      SkillType = "Fighting Move Choice Slot"
	FIGHTING_MOVE                  SkillType = "Fighting Move"
	ESOTERY_CHOICE_SLOT            SkillType = "Esotery Choice Slot"
	ESOTERY                        SkillType = "Esotery"
	TRICK_OF_THE_TRADE_CHOICE_SLOT SkillType = "Trick of the Trade Choice Slot"
	TRICK_OF_THE_TRADE             SkillType = "Trick of the Trade"
)

type Skill struct {
	CharacterSkillId string        `json:"characterSkillId" db:"id"`
	Name             string        `json:"name"`
	Category         SkillCategory `json:"category"`
	Description      string        `json:"description"`
	AttackModifier   int16         `json:"attackModifier" db:"attack_modifier"`
	ArmourModifier   int16         `json:"armourModifier" db:"armour_modifier"`
	Cost             int16         `json:"cost"`
	Type             SkillType     `json:"type"`
}

type Inability struct {
	ID          string `json:"characterInabilityId" db:"id"`
	Name        string `json:"name"`
	Description string `json:"description"`
}
