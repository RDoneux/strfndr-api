package models

type ItemType string
type EquipLocation string

const (
	CYPHER      ItemType = "Cypher"
	CYPHER_SLOT ItemType = "Cypher Slot"
	ARTIFACT    ItemType = "Artifact"
	EQUIPMENT   ItemType = "Equipment"
	ODDITY      ItemType = "Oddity"
	ODDITY_SLOT ItemType = "Oddity Slot"
	WEAPON      ItemType = "Weapon"
	WEAPON_SLOT ItemType = "Weapon Slot"
	AMMUNITION  ItemType = "Ammunition"
	ARMOUR      ItemType = "Armour"
	ARMOUR_SLOT ItemType = "Armour Slot"
)

const (
	HEAD     EquipLocation = "Head"
	EYES     EquipLocation = "Eyes"
	EARS     EquipLocation = "Ears"
	NECK     EquipLocation = "Neck"
	TORSO    EquipLocation = "Torso"
	LEGS     EquipLocation = "Legs"
	HANDS    EquipLocation = "Hands"
	FINGERS  EquipLocation = "Fingers"
	FOREARMS EquipLocation = "Forearms"
	FEET     EquipLocation = "Feet"
	NONE     EquipLocation = "None"
)

type Item struct {
	ID            string        `json:"characterItemId"`
	Name          string        `json:"name"`
	ItemType      ItemType      `json:"itemType" db:"item_type"`
	Description   string        `json:"description"`
	Weight        float64       `json:"weight"`
	Price         float64       `json:"price"`
	EquipLocation EquipLocation `json:"equipLocation" db:"equip_location"`
}
