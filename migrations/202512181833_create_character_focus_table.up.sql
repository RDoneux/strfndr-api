CREATE TABLE IF NOT EXISTS character_focus (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    special_effect TEXT
);

CREATE TABLE IF NOT EXISTS focus_trainings (
    id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    focus_id CHAR(36) NOT NULL,
    skill_id CHAR(36) NOT NULL,
    training_level ENUM('Trained', 'Specialised'),
    FOREIGN KEY (focus_id) REFERENCES character_focus (id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills (id) ON DELETE CASCADE
);

CREATE TABLE focus_tier_abilities (
    id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    focus_id CHAR(36) NOT NULL,
    tier INT NOT NULL,
    ability_name VARCHAR(255),
    ability_description TEXT,
    frequency VARCHAR(50),
    pool_cost VARCHAR(50),
    FOREIGN KEY (focus_id) REFERENCES character_focus (id)
);

CREATE TABLE focus_tier_ability_skills (
    id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    tier_ability_id CHAR(36) NOT NULL,
    skill_id CHAR(36) NOT NULL,
    FOREIGN KEY (tier_ability_id) REFERENCES focus_tier_abilities (id),
    FOREIGN KEY (skill_id) REFERENCES skills (id)
);

-- can't do until we have an equipment table
CREATE TABLE focus_equipment (
    id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    focus_id CHAR(36) NOT NULL,
    item_name VARCHAR(100),
    description TEXT,
    FOREIGN KEY (focus_id) REFERENCES character_focus (id)
);