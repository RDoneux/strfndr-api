CREATE TABLE armour_pool_modifiers (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    armour_id VARCHAR(36) NOT NULL,
    pool_type ENUM('MIGHT', 'SPEED', 'INTELLECT', 'ARMOUR') NOT NULL,
    modifier_value INT DEFAULT 0,
    edge_value INT DEFAULT 0,
    
    FOREIGN KEY (armour_id) REFERENCES armours(item_id) ON DELETE CASCADE
)