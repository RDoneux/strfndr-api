CREATE TABLE characters (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    name VARCHAR(100) NOT NULL,
    experience_points INT NOT NULL DEFAULT 0,
    tier SMALLINT NOT NULL DEFAULT 1,
    last_immediate_recovery INT DEFAULT 0,
    last_ten_minute_recovery INT DEFAULT 0,
    last_one_hour_recovery INT DEFAULT 0,
    last_ten_hour_recovery INT DEFAULT 0,

    character_type_id VARCHAR(36),
    character_descriptor_id VARCHAR(36),
    character_focus_id VARCHAR(36),

    shins INT NOT NULL DEFAULT 0,

    FOREIGN KEY (character_type_id) REFERENCES character_types(id) ON DELETE SET NULL,
    FOREIGN KEY (character_descriptor_id) REFERENCES character_descriptors(id) ON DELETE SET NULL,
    FOREIGN KEY (character_focus_id) REFERENCES character_foci(id) ON DELETE SET NULL
);

CREATE TABLE character_items (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36),
    item_id VARCHAR(36),
    source ENUM('TYPE', 'DESCRIPTOR', 'FOCUS', 'CUSTOM') NOT NULL,
    is_equipped BOOLEAN DEFAULT FALSE,
    quantity INT DEFAULT 1,
    level SMALLINT DEFAULT 1,

    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);

CREATE TABLE character_skills (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36),
    skill_id VARCHAR(36),
    training_level ENUM('UNTRAINED', 'TRAINED', 'SPECIALIZED') NOT NULL DEFAULT 'UNTRAINED',
    source ENUM('TYPE', 'DESCRIPTOR', 'FOCUS', 'CUSTOM') NOT NULL,

    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

CREATE TABLE character_inabilities (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36),
    skill_id VARCHAR(36),
    source ENUM('TYPE', 'DESCRIPTOR', 'FOCUS', 'CUSTOM') NOT NULL,

    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

CREATE TABLE character_special_abilities (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36),
    special_ability_id VARCHAR(36),
    source ENUM('TYPE', 'DESCRIPTOR', 'FOCUS', 'CUSTOM') NOT NULL,

    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE,
    FOREIGN KEY (special_ability_id) REFERENCES special_abilities(id) ON DELETE CASCADE
);

CREATE TABLE character_pool_modifiers (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36),

    might_current INT DEFAULT 0,
    might_max INT DEFAULT 0,
    might_edge INT DEFAULT 0,
    might_manual_modifier INT DEFAULT 0,
    might_edge_manual_modifier INT DEFAULT 0,

    speed_current INT DEFAULT 0,
    speed_max INT DEFAULT 0,
    speed_edge INT DEFAULT 0,
    speed_manual_modifier INT DEFAULT 0,
    speed_edge_manual_modifier INT DEFAULT 0,

    intellect_current INT DEFAULT 0,
    intellect_max INT DEFAULT 0,
    intellect_edge INT DEFAULT 0,
    intellect_manual_modifier INT DEFAULT 0,
    intellect_edge_manual_modifier INT DEFAULT 0,

    armour INT DEFAULT 0,
    armour_manual_modifier INT DEFAULT 0,

    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE
);