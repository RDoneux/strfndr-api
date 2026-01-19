package models

type Character struct {
	ID               string              `json:"id"`
	Name             string              `json:"name"`
	Shins            string              `json:"shins"`
	ExperiencePoints uint32              `json:"experiencePoints"`
	Tier             uint8               `json:"tier"`
	Background       CharacterBackground `json:"characterBackground"`
	UserId           string              `json:"userId"`
}

type CharacterBackground struct {
	Name        string `json:"name"`
	Description string `json:"description"`
}
