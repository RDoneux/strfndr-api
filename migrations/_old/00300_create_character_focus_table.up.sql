CREATE TABLE IF NOT EXISTS character_focus (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    connection TEXT,
    source_book VARCHAR(100),
    special_effect TEXT
);

-- CREATE TABLE IF NOT EXISTS character_focus_tier_classifications (
--     id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
--     focus_id CHAR(36) NOT NULL,
--     special_ability_id CHAR(36),
--     FOREIGN KEY (focus_id) REFERENCES character_focus (id) ON DELETE CASCADE,
--     FOREIGN KEY (special_ability_id) REFERENCES special_abilities (id) ON DELETE SET NULL
-- );

CREATE TABLE IF NOT EXISTS character_focus_pool_modifiers (
    id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    focus_id CHAR(36) NOT NULL,
    pool_type VARCHAR(10) NOT NULL CHECK (
        pool_type IN ('Might', 'Speed', 'Intellect')
    ),
    modifier_value INT NOT NULL,
    FOREIGN KEY (focus_id) REFERENCES character_focus (id) ON DELETE CASCADE,
    INDEX idx_focus_pool (focus_id)
);

CREATE TABLE IF NOT EXISTS character_focus_trainings (
    id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    focus_id CHAR(36) NOT NULL,
    special_ability_id CHAR(36),
    skill_id CHAR(36) NOT NULL,
    training_level ENUM('Trained', 'Specialised'),
    FOREIGN KEY (focus_id) REFERENCES character_focus (id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills (id) ON DELETE CASCADE,
    FOREIGN KEY (special_ability_id) REFERENCES special_abilities (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS character_focus_inabilities (
    id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    focus_id CHAR(36) NOT NULL,
    skill_id CHAR(36) NOT NULL,
    FOREIGN KEY (focus_id) REFERENCES character_focus (id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills (id) ON DELETE CASCADE
);