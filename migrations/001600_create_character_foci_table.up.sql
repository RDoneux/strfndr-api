CREATE TABLE character_foci (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    source_book VARCHAR(100) NOT NULL,
    connection TEXT
);

CREATE TABLE character_foci_pool_modifiers (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_foci_id VARCHAR(36),
    pool_type ENUM('MIGHT', 'SPEED', 'INTELLECT', 'SHINS') NOT NULL,
    modifier_value INT DEFAULT 0,
    edge_value INT DEFAULT 0,

    FOREIGN KEY (character_foci_id) REFERENCES character_foci(id) ON DELETE CASCADE
);

CREATE TABLE character_foci_skills (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_foci_id VARCHAR(36),
    skill_id VARCHAR(36),
    training_level ENUM('UNTRAINED', 'TRAINED', 'SPECIALIZED') NOT NULL DEFAULT 'UNTRAINED',

    FOREIGN KEY (character_foci_id) REFERENCES character_foci(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

CREATE TABLE character_foci_inabilities (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_foci_id VARCHAR(36),
    skill_id VARCHAR(36),

    FOREIGN KEY (character_foci_id) REFERENCES character_foci(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

CREATE TABLE character_foci_special_abilities (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_foci_id VARCHAR(36),
    special_ability_id VARCHAR(36),

    FOREIGN KEY (character_foci_id) REFERENCES character_foci(id) ON DELETE CASCADE,
    FOREIGN KEY (special_ability_id) REFERENCES special_abilities(id) ON DELETE CASCADE
);

CREATE TABLE character_foci_items (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_foci_id VARCHAR(36),
    item_id VARCHAR(36),

    FOREIGN KEY (character_foci_id) REFERENCES character_foci(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);

CREATE TABLE character_foci_tiers (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_foci_id VARCHAR(36),
    tier SMALLINT NOT NULL,

    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,

    FOREIGN KEY (character_foci_id) REFERENCES character_foci(id) ON DELETE CASCADE
);

CREATE TABLE character_foci_tier_skills (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_foci_tier_id VARCHAR(36),
    skill_id VARCHAR(36),
    training_level ENUM('UNTRAINED', 'TRAINED', 'SPECIALIZED') NOT NULL DEFAULT 'UNTRAINED',

    FOREIGN KEY (character_foci_tier_id) REFERENCES character_foci_tiers(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

CREATE TABLE character_foci_tier_special_abilities (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_foci_tier_id VARCHAR(36),
    special_ability_id VARCHAR(36),

    FOREIGN KEY (character_foci_tier_id) REFERENCES character_foci_tiers(id) ON DELETE CASCADE,
    FOREIGN KEY (special_ability_id) REFERENCES special_abilities(id) ON DELETE CASCADE
);