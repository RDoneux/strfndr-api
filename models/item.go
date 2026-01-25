package models

import (
	"github.com/rdoneux/nmna-api/types"
)

type ItemType string
type EquipLocation string
type CapacityType string
type WeightType string
type CypherType string

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

const (
	DART            CapacityType = "Dart"
	BUZZER_MAGAZINE CapacityType = "Buzzer Magazine"
	ARROW           CapacityType = "Arrow"
	BOLT            CapacityType = "Blot"
	HEAVY_BOLT      CapacityType = "Heavy Bolt"
)

const (
	LIGHT          WeightType = "Light"
	LIGHT_SPECIAL WeightType = "Light Special"
	MEDIUM         WeightType = "Medium"
	MEDIUM_SPECIAL WeightType = "Medium Special"
	HEAVY          WeightType = "Heavy"
)

const (
	ANOETIC CypherType = "Anoetic"
)

var ItemTypeToTable = map[string]string{
	"CYPHER":     "cyphers",
	"ARTIFACT":   "artifacts",
	"EQUIPMENT":  "equipment",
	"ODDITY":     "oddities",
	"WEAPON":     "weapons",
	"AMMUNITION": "ammunitions",
	"ARMOUR":     "armours",
}

type ListItem struct {
	ID          string   `json:"id" db:"id"`
	Name        string   `json:"name" db:"name"`
	ItemType    ItemType `json:"itemType" db:"item_type"`
	Description string   `json:"description" db:"description"`
	Weight      float64  `json:"weight" db:"weight"`
	Price       float64  `json:"price" db:"price"`
}

type Item struct {
	ListItem
	EquippedAt     *EquipLocation    `json:"equippedAt" db:"equipped_at"`
	Quantity       uint16            `json:"quantity" db:"quantity"`
	EquipLocations types.StringArray `json:"equipLocations" db:"equip_locations"`
}

type Artifact struct {
	Item
	LevelDescriptor string `json:"levelDescriptor" db:"level_descriptor"`
	Depletion       string `json:"depletion" db:"depletion"`
	Effect          string `json:"effect" db:"effect"`
}

type Weapon struct {
	Item
	Capacity     int32        `json:"capacity" db:"capactiy"`
	CapacityType CapacityType `json:"capacityType" db:"capacity_type"`
	WeightType   WeightType   `json:"weightType" db:"weight_type"`
}

type Oddity struct {
	Item
}

type Equipment struct {
	Item
}

type Ammunition struct {
	Item
	Type string `json:"type" db:"type"`
}

type Cypher struct {
	Item
	LevelDescriptor string     `json:"levelDescriptor" db:"level_descriptor"`
	CypherType      CypherType `json:"cypherType" db:"cypher_type"`
	Effect          string     `json:"effect" db:"effect"`
}

type Armour struct {
	Item
	WeightType WeightType `json:"weightType" db:"weight_type"`
}

func (item *Item) ToList() map[string]any {
	return map[string]any{
		"name":        item.Name,
		"description": item.Description,
		"type":        item.ItemType,
		"weight":      item.Weight,
		"price":       item.Price,
	}
}
