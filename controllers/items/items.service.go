package items

import (
	"database/sql"
	"encoding/json"
	"errors"
	"strconv"

	"github.com/Masterminds/squirrel"
	"github.com/jmoiron/sqlx"
	"github.com/rdoneux/nmna-api/models"
	"github.com/rdoneux/nmna-api/services"
)

func GetItemById(db sqlx.DB, itemId string) (map[string]any, error) {

	query, args, err := squirrel.
		Select("item_type").
		From("items").
		Where("id = ?", itemId).
		ToSql()
	if err != nil {
		return nil, err
	}

	var itemType string
	err = db.Get(&itemType, query, args...)
	if err != nil {
		return nil, err
	}

	joinTable := models.ItemTypeToTable[itemType]
	joinClause := joinTable + " ON items.id = " + joinTable + ".item_id"
	query, args, err = squirrel.
		Select("*").
		From("items").
		Join(joinClause).
		Where("items.id = ?", itemId).
		ToSql()

	rows, err := db.Queryx(query, args...)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	if rows.Next() {
		item := make(map[string]any)
		if err := rows.MapScan(item); err != nil {
			return nil, err
		}
		item = convertMapBytesToString(item)
		convertNumericStringsToFloat(item, "price", "weight", "capacity")
		return item, nil
	}

	return nil, sql.ErrNoRows

}

func GetItemTypes(db sqlx.DB) ([]string, error) {

	query, args, err := squirrel.
		Select("JSON_ARRAYAGG(item_type) AS types").
		FromSelect(
			squirrel.
				Select("DISTINCT item_type").
				From("items").
				Where("item_type NOT IN (?, ?, ?, ?)", "WEAPON_SLOT", "CYPHER_SLOT", "ARMOUR_SLOT", "ODDITY_SLOT"),
			"t",
		).
		ToSql()
	if err != nil {
		return nil, err
	}

	var result struct {
		Types string `db:"types"`
	}
	err = db.Get(&result, query, args...)
	if err != nil {
		return nil, err
	}

	var itemTypes []string
	err = json.Unmarshal([]byte(result.Types), &itemTypes)

	return itemTypes, nil

}

func CreateItem(db sqlx.DB, item models.Item) error {

	columns := []string{"name", "description", "weight", "price", "item_type"}
	values := []any{item.Name, item.Description, item.Weight, item.Price, item.ItemType}

	if item.ID != "" {
		columns = append([]string{"id"}, columns...)
		values = append([]any{item.ID}, values...)
	}

	query, args, err := squirrel.
		Insert("items").
		Columns(columns...).
		Values(values...).
		ToSql()
	if err != nil {
		return err
	}

	_, err = db.Exec(query, args...)
	return err

}

func UpdateRootItem(db sqlx.DB, item models.Item) error {

	query, args, err := squirrel.
		Update("items").
		Set("name", item.Name).
		Set("description", item.Description).
		Set("weight", item.Weight).
		Set("price", item.Price).
		ToSql()
	if err != nil {
		return err
	}

	db.Exec(query, args...)

	return nil

}

func ConstructItemInsertStatement(itemMap map[string]any, id string, insertStatement squirrel.InsertBuilder) (squirrel.InsertBuilder, error) {

	itemType := itemMap["itemType"]

	switch itemType {
	case "WEAPON":

		weapon, err := services.MapToStruct[models.Weapon](itemMap)
		if err != nil {
			return squirrel.InsertBuilder{}, err
		}

		return insertStatement.
			Columns("capacity", "capacity_type", "weight_type", "item_id").
			Values(weapon.Capacity, weapon.CapacityType, weapon.WeightType, id), nil

	case "ARTIFACT":

		artifact, err := services.MapToStruct[models.Artifact](itemMap)
		if err != nil {
			return squirrel.InsertBuilder{}, err
		}

		return insertStatement.
			Columns("level_descriptor", "depletion", "effect", "item_id").
			Values(artifact.LevelDescriptor, artifact.Depletion, artifact.Effect, id), nil

	case "ODDITY":

		// oddity has no additional properties yet
		_, err := services.MapToStruct[models.Oddity](itemMap)
		if err != nil {
			return squirrel.InsertBuilder{}, err
		}

		return insertStatement.
			Columns("item_id").
			Values(id), nil

	case "EQUIPMENT":

		// equipment has no additional properties yet
		_, err := services.MapToStruct[models.Equipment](itemMap)
		if err != nil {
			return squirrel.InsertBuilder{}, err
		}

		return insertStatement.
			Columns("item_id").
			Values(id), nil

	case "AMMUNITION":

		ammunition, err := services.MapToStruct[models.Ammunition](itemMap)
		if err != nil {
			return squirrel.InsertBuilder{}, err
		}

		return insertStatement.
			Columns("item_id", "type").
			Values(id, ammunition.Type), nil

	case "CYPHER":

		cypher, err := services.MapToStruct[models.Cypher](itemMap)
		if err != nil {
			return squirrel.InsertBuilder{}, err
		}

		return insertStatement.
			Columns("item_id", "cypher_type", "level_descriptor", "effect").
			Values(id, cypher.CypherType, cypher.LevelDescriptor, cypher.Effect), nil

	case "ARMOUR":

		armour, err := services.MapToStruct[models.Armour](itemMap)
		if err != nil {
			return squirrel.InsertBuilder{}, err
		}

		return insertStatement.
			Columns("item_id", "weight_type").
			Values(id, armour.WeightType), nil

	default:
		return insertStatement, errors.New("Item Type not recognised")
	}
}

func ConstructItemUpdateStatement(itemMap map[string]any, updateStatement squirrel.UpdateBuilder) (squirrel.UpdateBuilder, error) {

	itemType := itemMap["itemType"]

	switch itemType {
	case "WEAPON":

		weapon, err := services.MapToStruct[models.Weapon](itemMap)
		if err != nil {
			return squirrel.UpdateBuilder{}, err
		}

		return updateStatement.
			Set("capacity", weapon.Capacity).
			Set("capacity_type", weapon.CapacityType).
			Set("weight_type", weapon.WeightType), nil

	case "ARTIFACT":

		artifact, err := services.MapToStruct[models.Artifact](itemMap)
		if err != nil {
			return squirrel.UpdateBuilder{}, err
		}

		return updateStatement.
			Set("level_descriptor", artifact.LevelDescriptor).
			Set("depletion", artifact.Depletion).
			Set("effect", artifact.Effect), nil

	case "ODDITY":

		// oddity has no additional properties yet
		_, err := services.MapToStruct[models.Oddity](itemMap)
		if err != nil {
			return squirrel.UpdateBuilder{}, err
		}

		return updateStatement, nil

	case "EQUIPMENT":

		// equipment has no additional properties yet
		_, err := services.MapToStruct[models.Equipment](itemMap)
		if err != nil {
			return squirrel.UpdateBuilder{}, err
		}

		return updateStatement, nil

	case "AMMUNITION":

		ammunition, err := services.MapToStruct[models.Ammunition](itemMap)
		if err != nil {
			return squirrel.UpdateBuilder{}, err
		}

		return updateStatement.
			Set("type", ammunition.Type), nil

	case "CYPHER":

		cypher, err := services.MapToStruct[models.Cypher](itemMap)
		if err != nil {
			return squirrel.UpdateBuilder{}, err
		}

		return updateStatement.
			Set("cypher_type", cypher.CypherType).
			Set("level_descriptor", cypher.LevelDescriptor).
			Set("effect", cypher.Effect), nil

	case "ARMOUR":

		armour, err := services.MapToStruct[models.Armour](itemMap)
		if err != nil {
			return squirrel.UpdateBuilder{}, err
		}

		return updateStatement.
			Set("weight_type", armour.WeightType), nil

	default:
		return updateStatement, errors.New("Item Type not recognised")
	}

}

func DeleteItem(db sqlx.DB, id string) error {

	query, args, err := squirrel.
		Delete("items").
		Where("id = ?", id).
		ToSql()
	if err != nil {
		return err
	}

	_, err = db.Exec(query, args...)
	if err != nil {
		return err
	}

	return nil

}

func convertMapBytesToString(m map[string]any) map[string]any {
	for k, v := range m {
		switch val := v.(type) {
		case []byte:
			m[k] = string(val)
		}
	}
	return m
}

func convertNumericStringsToFloat(m map[string]any, keys ...string) {
    for _, k := range keys {
        if v, ok := m[k]; ok {
            if s, ok := v.(string); ok {
                if f, err := strconv.ParseFloat(s, 64); err == nil {
                    m[k] = f
                }
            }
        }
    }
}
