CREATE TABLE IF NOT EXISTS character_skills (
    character_id VARCHAR(36) NOT NULL,
    skill_id VARCHAR(36) NOT NULL,
    training_level ENUM('Trained','Specialised') NOT NULL,
    source ENUM('Descriptor','Focus','Type') NOT NULL,
    PRIMARY KEY (character_id, skill_id),
    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);
