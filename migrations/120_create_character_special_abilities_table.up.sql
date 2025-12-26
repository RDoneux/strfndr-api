CREATE TABLE IF NOT EXISTS character_special_abilities (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36) NOT NULL,
    special_ability_id VARCHAR(36) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (character_id) REFERENCES characters(id),
    FOREIGN KEY (special_ability_id) REFERENCES special_abilities(id)
)