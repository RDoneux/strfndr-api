CREATE TABLE IF NOT EXISTS character_appearances (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36) NOT NULL,
    port_of_call VARCHAR(100),
    homeworld VARCHAR(100),
    age INT,
    gender VARCHAR(50),
    pronouns VARCHAR(50),
    height_cm INT,
    weight_kg INT,
    appearance_description TEXT,
    
    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE
)