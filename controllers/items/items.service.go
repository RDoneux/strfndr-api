package items

import (
	"database/sql"
	"encoding/json"

	"github.com/Masterminds/squirrel"
	"github.com/jmoiron/sqlx"
	"github.com/rdoneux/nmna-api/models"
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
		return convertMapBytesToString(item), nil
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

func convertMapBytesToString(m map[string]any) map[string]any {
    for k, v := range m {
        switch val := v.(type) {
        case []byte:
            m[k] = string(val)
        }
    }
    return m
}