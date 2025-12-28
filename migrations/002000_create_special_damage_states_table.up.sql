CREATE TABLE special_damage_states (
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    effect TEXT
);

CREATE TABLE character_special_damage_states(
    id VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    character_id VARCHAR(36),
    special_damage_state_id VARCHAR(36),
    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE,
    FOREIGN KEY (special_damage_state_id) REFERENCES special_damage_states(id) ON DELETE CASCADE
);