CREATE TABLE skill_weapon_requirements (
    skill_id VARCHAR(36) NOT NULL,
    trait_id VARCHAR(36) NOT NULL,
    
    PRIMARY KEY (skill_id, trait_id),
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE,
    FOREIGN KEY (trait_id) REFERENCES traits(id) ON DELETE CASCADE
);