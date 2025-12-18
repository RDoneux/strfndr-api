CREATE TABLE IF NOT EXISTS character_descriptors (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    source_book VARCHAR(100),
    special_effect TEXT
);

CREATE TABLE IF NOT EXISTS character_descriptor_pool_modifiers (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    descriptor_id VARCHAR(36) NOT NULL,
    pool_type VARCHAR(10) NOT NULL CHECK (pool_type IN ('Might', 'Speed', 'Intellect')),
    modifier_value INT NOT NULL,

    FOREIGN KEY (descriptor_id) REFERENCES character_descriptors (id) ON DELETE CASCADE,
    INDEX idx_descriptor_pool (descriptor_id)
);

CREATE TABLE IF NOT EXISTS character_descriptor_trainings (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    descriptor_id VARCHAR(36) NOT NULL,
    skill_id VARCHAR(36) NOT NULL,
    training_level ENUM('Trained', 'Specialised'),

    FOREIGN KEY (descriptor_id) REFERENCES character_descriptors (id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS character_descriptor_inabilities (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    descriptor_id VARCHAR(36) NOT NULL,
    skill_id VARCHAR(36) NOT NULL,

    FOREIGN KEY (descriptor_id) REFERENCES character_descriptors (id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills (id) ON DELETE CASCADE
);