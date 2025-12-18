CREATE TABLE IF NOT EXISTS `classes` (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    key_ability_score VARCHAR(50),
    hit_points_per_level INT,
    traits VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE `characters`
ADD CONSTRAINT fk_character_class
FOREIGN KEY (class_id) REFERENCES classes(id) 
ON DELETE SET NULL ON UPDATE CASCADE;