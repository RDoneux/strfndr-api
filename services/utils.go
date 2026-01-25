package services

import "encoding/json"

func MapToStruct[T any](m map[string]any) (T, error) {
	var result T
	bite, err := json.Marshal(m)
	if err != nil {
		return result, err
	}
	err = json.Unmarshal(bite, &result)
	return result, err
}