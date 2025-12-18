CREATE TABLE IF NOT EXISTS saving_throws (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36) NOT NULL,
    saving_throw_name VARCHAR(100) NOT NULL,
    proficiency_level_id VARCHAR(36) NOT NULL,
    modifying_attribute VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (proficiency_level_id) REFERENCES skill_proficiencies(id) ON DELETE CASCADE ON UPDATE CASCADE,

    INDEX idx_character_id (character_id)
)