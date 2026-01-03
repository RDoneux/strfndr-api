CREATE TABLE character_types (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    source_book VARCHAR(100)
);

CREATE TABLE character_types_pool_modifiers (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_type_id VARCHAR(36),
    pool_type ENUM('MIGHT', 'SPEED', 'INTELLECT', 'SHINS', 'ARMOUR') NOT NULL,
    modifier_value INT DEFAULT 0,
    edge_value INT DEFAULT 0,
    FOREIGN KEY (character_type_id) REFERENCES character_types(id) ON DELETE CASCADE
);

CREATE TABLE character_types_skills (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_type_id VARCHAR(36),
    skill_id VARCHAR(36),
    training_level ENUM('UNTRAINED', 'TRAINED', 'SPECIALIZED') NOT NULL DEFAULT 'UNTRAINED',
    FOREIGN KEY (character_type_id) REFERENCES character_types(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

CREATE TABLE character_types_inabilities (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_type_id VARCHAR(36),
    inability_id VARCHAR(36),
    FOREIGN KEY (character_type_id) REFERENCES character_types(id) ON DELETE CASCADE,
    FOREIGN KEY (inability_id) REFERENCES inabilities(id) ON DELETE CASCADE
);

CREATE TABLE character_types_items (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_type_id VARCHAR(36),
    item_id VARCHAR(36),

    FOREIGN KEY (character_type_id) REFERENCES character_types(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);

CREATE TABLE character_types_tiers (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_type_id VARCHAR(36),
    tier SMALLINT NOT NULL,

    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,

    FOREIGN KEY (character_type_id) REFERENCES character_types(id) ON DELETE CASCADE
);

CREATE TABLE character_types_tier_skills (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_type_tier_id VARCHAR(36),
    skill_id VARCHAR(36),
    training_level ENUM('UNTRAINED', 'TRAINED', 'SPECIALIZED') NOT NULL DEFAULT 'UNTRAINED',

    FOREIGN KEY (character_type_tier_id) REFERENCES character_types_tiers(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

CREATE TABLE character_types_tier_pool_modifiers (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_type_tier_id VARCHAR(36),
    pool_type ENUM('MIGHT', 'SPEED', 'INTELLECT', 'SHINS', 'ARMOUR', 'EFFORT') NOT NULL,
    modifier_value INT DEFAULT 0,
    edge_value INT DEFAULT 0,

    FOREIGN KEY (character_type_tier_id) REFERENCES character_types_tiers(id) ON DELETE CASCADE
);

CREATE TABLE character_types_tier_equipment (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_type_tier_id VARCHAR(36),
    equipment_item_id VARCHAR(36),

    FOREIGN KEY (character_type_tier_id) REFERENCES character_types_tiers(id) ON DELETE CASCADE,
    FOREIGN KEY (equipment_item_id) REFERENCES items(id) ON DELETE CASCADE
);