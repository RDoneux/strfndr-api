CREATE TABLE IF NOT EXISTS ranged_weapons (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36) NOT NULL,
    name VARCHAR(255) NOT NULL,
    `range` VARCHAR(100) NOT NULL,
    damage VARCHAR(100) NOT NULL,
    capacity VARCHAR(100),
    `usage` VARCHAR(100) DEFAULT NULL,
    is_magnetic BOOLEAN NOT NULL DEFAULT FALSE,
    is_experimental BOOLEAN NOT NULL DEFAULT FALSE,
    level INT NOT NULL DEFAULT 1,
    critical VARCHAR(250) DEFAULT NULL,
    weight DECIMAL(10,2) DEFAULT NULL,
    category VARCHAR(100) DEFAULT NULL,
    type VARCHAR(100) DEFAULT NULL,
    notes TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE ON UPDATE CASCADE,

    INDEX idx_character_id (character_id),
    INDEX idx_name (name),
    INDEX idx_level (level),
    INDEX idx_category (category),
    INDEX idx_type (type)
);