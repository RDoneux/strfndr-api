CREATE TABLE special_abilities (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    tier INT NOT NULL,
    type ENUM('Action', 'Enabler', 'Defense', 'Utility') NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT
)