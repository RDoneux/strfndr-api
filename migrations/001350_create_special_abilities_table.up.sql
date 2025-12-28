CREATE TABLE special_abilities (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    tier INT NOT NULL,
    type VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT
)