package services

import "golang.org/x/crypto/bcrypt"

func Encrypt(value string) (string, error) {
	hashedValue, err := bcrypt.GenerateFromPassword([]byte(value), bcrypt.DefaultCost)
	if err != nil {
		return "", err
	}

	return string(hashedValue), nil
}
