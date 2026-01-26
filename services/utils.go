package services

import (
	"encoding/json"
	"regexp"

	"github.com/jmoiron/sqlx"
)

func MapToStruct[T any](m map[string]any) (T, error) {
	var result T
	bite, err := json.Marshal(m)
	if err != nil {
		return result, err
	}
	err = json.Unmarshal(bite, &result)
	return result, err
}

func GetEnumValue(db sqlx.DB, tableName, columnName string ) ([]string, error) {

	var result string
	err := db.Get(&result, "SELECT COLUMN_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '" + tableName + "' AND COLUMN_NAME = '" + columnName + "'")
	if err != nil {
		return nil, err
	}

	regex := regexp.MustCompile(`'([^']*)'`)
	matches := regex.FindAllStringSubmatch(result, -1)

	var enumValues []string
	for _, match := range matches {
		enumValues = append(enumValues, match[1])
	}

	return enumValues, nil

}