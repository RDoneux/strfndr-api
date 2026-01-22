CREATE TABLE items (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    weight DECIMAL(10,2) DEFAULT 1.0,
    price DECIMAL(10,2) DEFAULT 0.0,
    item_type ENUM ('WEAPON', 'WEAPON_SLOT', 'ARMOUR', 'ARMOUR_SLOT', 'CYPHER', 'CYPHER_SLOT', 'ARTIFACT', 'EQUIPMENT', 'ODDITY', 'ODDITY_SLOT', 'AMMUNITION', 'WRIST') NOT NULL
);

CREATE TABLE item_equip_locations (
    item_id VARCHAR(36) NOT NULL,
    equip_location ENUM ('HEAD', 'EYES', 'EARS', 'NECK', 'TORSO', 'LEGS', 'HANDS', 'FOREARM', 'FEET', 'NONE') DEFAULT 'NONE',
    PRIMARY KEY (item_id, equip_location),
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);