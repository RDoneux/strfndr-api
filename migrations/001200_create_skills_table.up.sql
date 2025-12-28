CREATE TABLE skills (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    name VARCHAR(100) NOT NULL,
    category ENUM('MIGHT', 'SPEED', 'INTELLECT', 'CUSTOM') NOT NULL,
    description TEXT,
    attack_modifier SMALLINT DEFAULT 0
)