CREATE TABLE weapon_traits (
    weapon_id VARCHAR(36) NOT NULL,
    trait_id VARCHAR(36) NOT NULL,
    
    PRIMARY KEY (weapon_id, trait_id),
    FOREIGN KEY (weapon_id) REFERENCES weapons(item_id) ON DELETE CASCADE,
    FOREIGN KEY (trait_id) REFERENCES traits(id) ON DELETE CASCADE
)