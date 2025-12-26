CREATE TABLE IF NOT EXISTS characters (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    name VARCHAR(100) NOT NULL,
    descriptor_id VARCHAR(36),
    type_id VARCHAR(36),
    focus_id VARCHAR(36),

    experience_points INT DEFAULT 0,
    tier INT DEFAULT 1,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (descriptor_id) REFERENCES character_descriptors (id) ON DELETE SET NULL,
    FOREIGN KEY (type_id) REFERENCES character_types (id) ON DELETE SET NULL,
    FOREIGN KEY (focus_id) REFERENCES character_focus (id) ON DELETE SET NULL
);