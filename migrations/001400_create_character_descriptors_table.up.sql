CREATE TABLE character_descriptors (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    source_book VARCHAR(100) NOT NULL
);

CREATE TABLE character_descriptor_pool_modifiers (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    descriptor_id VARCHAR(36),
    pool_type ENUM('MIGHT', 'SPEED', 'INTELLECT', 'SHINS', 'ARMOUR') NOT NULL,
    modifier_value INT DEFAULT 0,
    edge_value INT DEFAULT 0,

    FOREIGN KEY (descriptor_id) REFERENCES character_descriptors(id) ON DELETE CASCADE
);

CREATE TABLE character_descriptor_skills (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    descriptor_id VARCHAR(36),
    skill_id VARCHAR(36),
    training_level ENUM('UNTRAINED', 'TRAINED', 'SPECIALIZED') NOT NULL DEFAULT 'UNTRAINED',

    FOREIGN KEY (descriptor_id) REFERENCES character_descriptors(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

CREATE TABLE character_descriptor_inabilities (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    descriptor_id VARCHAR(36),
    inability_id VARCHAR(36),

    FOREIGN KEY (descriptor_id) REFERENCES character_descriptors(id) ON DELETE CASCADE,
    FOREIGN KEY (inability_id) REFERENCES inabilities(id) ON DELETE CASCADE
);

CREATE TABLE character_descriptor_special_abilities (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    descriptor_id VARCHAR(36),
    special_ability_id VARCHAR(36),

    FOREIGN KEY (descriptor_id) REFERENCES character_descriptors(id) ON DELETE CASCADE,
    FOREIGN KEY (special_ability_id) REFERENCES special_abilities(id) ON DELETE CASCADE
);

CREATE TABLE character_descriptor_items (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    descriptor_id VARCHAR(36),
    item_id VARCHAR(36),

    FOREIGN KEY (descriptor_id) REFERENCES character_descriptors(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);