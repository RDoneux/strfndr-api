CREATE TABLE IF NOT EXISTS `characters` (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_name VARCHAR(255) NOT NULL,
    player_name VARCHAR(255),

    experience BIGINT DEFAULT 0,
    level INT DEFAULT 1,
    
    ancestry VARCHAR(100),
    background VARCHAR(100),
    traits TEXT,
    heritage TEXT,
    class_id CHAR(36),

    strength INT DEFAULT 10,
    dexterity INT DEFAULT 10,
    constitution INT DEFAULT 10,
    intelligence INT DEFAULT 10,
    wisdom INT DEFAULT 10,
    charisma INT DEFAULT 10,

    hit_point_maximum INT DEFAULT 10,
    hit_point_current INT DEFAULT 10,
    wounded INT DEFAULT 0,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_level (level),
    INDEX idx_created_at (created_at),
    INDEX idx_updated_at (updated_at)
);