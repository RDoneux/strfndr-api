CREATE TABLE items (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    weight DECIMAL(10,2) DEFAULT 0.0,
    price INT DEFAULT 0,
    item_type ENUM ('WEAPON', 'ARMOR', 'CYPHER', 'ARTIFACT', 'EQUIPMENT', 'ODDITY') NOT NULL,
    can_be_equipped BOOLEAN DEFAULT FALSE
)