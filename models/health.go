package models

type HealthStatus struct {
	Status   string `json:"status"`
	Message  string `json:"message"`
	Database string `json:"database"`
}

const (
	STATUS_UP   = "UP"
	STATUS_DOWN = "DOWN"
)
