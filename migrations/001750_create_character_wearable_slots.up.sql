CREATE TABLE character_wearable_slots (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36) NOT NULL,

    character_items_id VARCHAR(36) NOT NULL,
    location VARCHAR(50) NOT NULL,

    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE,
    FOREIGN KEY (character_items_id) REFERENCES character_items(id) ON DELETE CASCADE
);