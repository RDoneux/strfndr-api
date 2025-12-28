CREATE TABLE hazard_states (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    source VARCHAR(100) NOT NULL,
    damage VARCHAR(255) NOT NULL,
    notes TEXT
);

CREATE TABLE character_hazard_states (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36),
    hazard_state_id VARCHAR(36),
    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE,
    FOREIGN KEY (hazard_state_id) REFERENCES hazard_states(id) ON DELETE CASCADE
);