package services

import (
	"os"
	"time"

	"github.com/golang-jwt/jwt/v5"
	"golang.org/x/crypto/bcrypt"
)

func Encrypt(value string) (string, error) {
	hashedValue, err := bcrypt.GenerateFromPassword([]byte(value), bcrypt.DefaultCost)
	if err != nil {
		return "", err
	}

	return string(hashedValue), nil
}


func GenerateJWT(username string) (accessToken, refreshToken string, err error) {
	var jwtSecret = []byte(os.Getenv("JWT_SECRET"))
	accessClaims := jwt.MapClaims{
		"username": username,
		"exp":      time.Now().Add(15 * time.Minute).Unix(),
		"type": "access",
	}
	access := jwt.NewWithClaims(jwt.SigningMethodHS256, accessClaims)
	accessToken, accessErr := access.SignedString(jwtSecret)
	if accessErr != nil {
		return 
	}

	refreshClaims := jwt.MapClaims{
		"username": username,
		"exp":      time.Now().Add(time.Hour * 24).Unix(),
		"type": "refresh",
	}
	refresh := jwt.NewWithClaims(jwt.SigningMethodHS256, refreshClaims)
	refreshToken, refreshErr := refresh.SignedString(jwtSecret)
	if refreshErr != nil {
		return
	}
	return
}
