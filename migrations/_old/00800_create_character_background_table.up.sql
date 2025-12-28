CREATE TABLE IF NOT EXISTS character_backgrounds(
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36) NOT NULL,
    background TEXT NOT NULL,

    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE
)