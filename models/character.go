package models

type Character struct {
	Name             string `json:"name"`
	Shins            string `json:"shins"`
	ExperiencePoints uint32 `json:"experiencePoints"`
	Tier             uint8  `json:"tier"`
	UserId           string `json:"userId"`
}