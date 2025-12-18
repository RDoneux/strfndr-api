CREATE TABLE IF NOT EXISTS character_skills (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id CHAR(36) NOT NULL,
    skill_name VARCHAR(100) NOT NULL,
    skill_rank INT DEFAULT 0,
    proficiency_level_id CHAR(36) NOT NULL DEFAULT 'fff2c643-1867-4fc6-908c-9609fd6ce594',
    modifying_attribute VARCHAR(50),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE,
    FOREIGN KEY (proficiency_level_id) REFERENCES skill_proficiencies(id) ON DELETE CASCADE ON UPDATE CASCADE,

    INDEX idx_character_id (character_id),
    INDEX idx_skill_name (skill_name)
)