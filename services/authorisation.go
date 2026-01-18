package services

import (
	"crypto/sha256"
	"database/sql"
	"os"
	"time"

	"github.com/Masterminds/squirrel"
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

const (
	TOKEN_TYPE_ACCESS  = "access"
	TOKEN_TYPE_REFRESH = "refresh"
)

func GenerateJWT(username string) (accessToken, refreshToken string, err error) {
	var jwtSecret = []byte(os.Getenv("JWT_SECRET"))
	accessClaims := jwt.MapClaims{
		"username": username,
		"exp":      time.Now().Add(15 * time.Minute).Unix(),
		"type":     TOKEN_TYPE_ACCESS,
	}
	access := jwt.NewWithClaims(jwt.SigningMethodHS256, accessClaims)
	accessToken, accessErr := access.SignedString(jwtSecret)
	if accessErr != nil {
		return
	}

	refreshClaims := jwt.MapClaims{
		"username": username,
		"exp":      time.Now().Add(time.Hour * 24).Unix(),
		"type":     TOKEN_TYPE_REFRESH,
	}
	refresh := jwt.NewWithClaims(jwt.SigningMethodHS256, refreshClaims)
	refreshToken, refreshErr := refresh.SignedString(jwtSecret)
	if refreshErr != nil {
		return
	}
	return
}

func HashTokenForStorage(token string) ([]byte, error) {
	digest := sha256.Sum256([]byte(token))
	return bcrypt.GenerateFromPassword(digest[:], bcrypt.DefaultCost)
}

func UpdateRefreshTokenHashForUser(refreshToken, username string, db *sql.DB) error {
	// hash token
	hashedToken, err := HashTokenForStorage(refreshToken)
	if err != nil {
		return err
	}

	// build query
	query, args, err := squirrel.Update("users").
		Set("refresh_token_hash", hashedToken).
		Where("username = ?", username).
		ToSql()
	if err != nil {
		return err
	}
	_, err = db.Exec(query, args...)

	return err
}
