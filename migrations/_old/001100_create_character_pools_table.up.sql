CREATE TABLE IF NOT EXISTS character_pools (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    character_id VARCHAR(36) NOT NULL,

    might_current INT NOT NULL,
    might_max INT NOT NULL,
    might_edge INT NOT NULL,

    speed_current INT NOT NULL,
    speed_max INT NOT NULL,
    speed_edge INT NOT NULL,

    intellect_current INT NOT NULL,
    intellect_max INT NOT NULL,
    intellect_edge INT NOT NULL,

    FOREIGN KEY (character_id) REFERENCES characters (id) ON DELETE CASCADE,
    UNIQUE (character_id)
);
