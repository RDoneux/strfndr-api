CREATE TABLE IF NOT EXISTS character_types (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    name TEXT NOT NULL,
    description TEXT,
    pool_modifier INT,
    pool_modifier_target VARCHAR(10) CHECK (
        pool_modifier_target IN ('Might', 'Speed', 'Intellect')
    ),
    special_effect TEXT
)