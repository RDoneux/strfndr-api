package config

import (
	"fmt"
	"os"
)

type DatabaseConfig struct {
	Host     string
	User     string
	Password string
	Database string
	Port     string
}

func GetDatabaseConfig() *DatabaseConfig {
	return &DatabaseConfig{
		Host:     os.Getenv("DB_HOST"),
		User:     os.Getenv("DB_USER"),
		Password: os.Getenv("DB_PASSWORD"),
		Database: os.Getenv("DB_NAME"),
		Port:     os.Getenv("DB_PORT"),
	}
}

func (config *DatabaseConfig) ConnectionString() (string, error) {
	err := config.validate()
	if err != nil {
		return "", err
	}
	return fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?parseTime=true",
		config.User,
		config.Password,
		config.Host,
		config.Port,
		config.Database,
	), nil
}

func (config *DatabaseConfig) validate() error {
	if config.Host == "" || config.User == "" || config.Password == "" || config.Database == "" || config.Port == "" {
		return fmt.Errorf("database configuration is incomplete")
	}
	return nil
}
