CREATE TABLE armour_pool_modifiers (
    armour_id VARCHAR(36) PRIMARY KEY,
    pool_type ENUM('MIGHT', 'SPEED', 'INTELLECT') NOT NULL,
    modifier_value INT DEFAULT 0,
    edge_value INT DEFAULT 0,
    
    FOREIGN KEY (armour_id) REFERENCES armour(item_id) ON DELETE CASCADE
)