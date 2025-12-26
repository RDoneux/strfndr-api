CREATE TABLE IF NOT EXISTS character_types (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    name TEXT NOT NULL,
    description TEXT,
    source_book VARCHAR(100),
    special_effect TEXT
);

CREATE TABLE IF NOT EXISTS character_types_pool_modifiers (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    type_id VARCHAR(36) NOT NULL,
    pool_type VARCHAR(10) NOT NULL CHECK (
        pool_type IN ('Might', 'Speed', 'Intellect')
    ),
    modifier_value INT NOT NULL,
    edge_value INT NOT NULL DEFAULT 0,
    FOREIGN KEY (type_id) REFERENCES character_types (id) ON DELETE CASCADE,
    INDEX idx_character_type_pool (type_id)
);

CREATE TABLE IF NOT EXISTS character_types_trainings (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    type_id VARCHAR(36) NOT NULL,
    skill_id VARCHAR(36) NOT NULL,
    training_level ENUM('Trained', 'Specialised'),
    FOREIGN KEY (type_id) REFERENCES character_types (id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS character_types_inabilities (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    type_id VARCHAR(36) NOT NULL,
    skill_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (type_id) REFERENCES character_types (id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills (id) ON DELETE CASCADE
);

CREATE TABLE character_types_equipment (
    id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    type_id CHAR(36) NOT NULL,
    item_id VARCHAR(36),
    description TEXT,
    FOREIGN KEY (type_id) REFERENCES character_types (id)
);