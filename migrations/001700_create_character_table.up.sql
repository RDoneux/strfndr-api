CREATE TABLE characters (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
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
    user_id VARCHAR(36),
    shins INT NOT NULL DEFAULT 0,
    FOREIGN KEY (character_type_id) REFERENCES character_types (id) ON DELETE CASCADE,
    FOREIGN KEY (character_descriptor_id) REFERENCES character_descriptors (id) ON DELETE CASCADE,
    FOREIGN KEY (character_focus_id) REFERENCES character_foci (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE SET NULL
);

CREATE TABLE character_items (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    character_id VARCHAR(36) NOT NULL,
    item_id VARCHAR(36),
    source ENUM(
        'TYPE',
        'DESCRIPTOR',
        'FOCUS',
        'CUSTOM'
    ) NOT NULL,
    is_equipped BOOLEAN DEFAULT FALSE,
    quantity INT DEFAULT 1,
    level SMALLINT DEFAULT 1,
    FOREIGN KEY (character_id) REFERENCES characters (id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items (id) ON DELETE CASCADE
);

CREATE TABLE character_worn_items (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    character_id VARCHAR(36) NOT NULL,
    character_items_id VARCHAR(36) NOT NULL UNIQUE,
    location ENUM(
        'HEAD',
        'EYES',
        'EARS',
        'NECK',
        'TORSO',
        'LEGS',
        'HANDS',
        'FINGERS',
        'FOREARMS',
        'FEET',
        'NONE'
    ),

    FOREIGN KEY (character_items_id) REFERENCES character_items (id) ON DELETE CASCADE,
    FOREIGN KEY (character_id) REFERENCES characters (id) ON DELETE CASCADE
);

CREATE TABLE character_skills (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    character_id VARCHAR(36),
    skill_id VARCHAR(36),
    training_level ENUM(
        'UNTRAINED',
        'TRAINED',
        'SPECIALIZED'
    ) NOT NULL DEFAULT 'UNTRAINED',
    source ENUM(
        'TYPE',
        'DESCRIPTOR',
        'FOCUS',
        'CUSTOM'
    ) NOT NULL,
    FOREIGN KEY (character_id) REFERENCES characters (id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills (id) ON DELETE CASCADE
);

CREATE TABLE character_inabilities (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    character_id VARCHAR(36),
    inability_id VARCHAR(36),
    source ENUM(
        'TYPE',
        'DESCRIPTOR',
        'FOCUS',
        'CUSTOM'
    ) NOT NULL,
    FOREIGN KEY (character_id) REFERENCES characters (id) ON DELETE CASCADE,
    FOREIGN KEY (inability_id) REFERENCES inabilities (id) ON DELETE CASCADE
);

CREATE TABLE character_pools (
    character_id VARCHAR(36) PRIMARY KEY,
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
    effort INT DEFAULT 0,
    FOREIGN KEY (character_id) REFERENCES characters (id) ON DELETE CASCADE
);