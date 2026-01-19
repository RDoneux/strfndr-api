CREATE TABLE character_backgrounds (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36) NOT NULL,
    name VARCHAR(255) DEFAULT "",
    description TEXT
);