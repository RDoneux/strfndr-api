CREATE TABLE artifacts (
    item_id VARCHAR(36) PRIMARY KEY,
    level SMALLINT DEFAULT 1,
    depletion VARCHAR(100),
    capacity_type VARCHAR(100),
    capacity INT,
    damage INT,

    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
)