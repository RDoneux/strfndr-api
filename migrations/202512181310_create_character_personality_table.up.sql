CREATE TABLE IF NOT EXISTS character_personalities (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36) NOT NULL,

    attitude TEXT,
    deity_or_philosophy TEXT,
    edicts TEXT,
    anathema TEXT,
    likes TEXT,
    dislikes TEXT,
    catchphrases TEXT,
    
    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE
)