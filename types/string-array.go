package types

import (
	"encoding/json"
	"fmt"
)

type StringArray []string

func (array *StringArray) Scan(src interface{}) error {

	if src == nil {
		*array = nil
		return nil
	}

	var data []byte
	switch variable := src.(type) {
	case string:
		data = []byte(variable)
	case []byte:
		data = variable
	default:
		return fmt.Errorf("unsupported type for StringArray: %T", src)
	}

	return json.Unmarshal(data, array)

}