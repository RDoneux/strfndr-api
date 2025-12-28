CREATE TABLE weapons (
    item_id VARCHAR(36) PRIMARY KEY,
    capacity INT,
    capacity_type VARCHAR(50),
    weight_type ENUM ('LIGHT', 'MEDIUM', 'HEAVY'),
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
)