INSERT INTO character_types_tiers (
    character_type_id,
    tier,
    name,
    description
) VALUES (
    (SELECT id FROM character_types WHERE name = 'Glaive'),
    1,
    'First-Tier Glaive',
    'As a first-tier Glaive, you are a novice warrior, just beginning your journey in mastering combat skills and tactics.'
),
(
    (SELECT id FROM character_types WHERE name = 'Glaive'),
    2,
    'Second-Tier Glaive',
    'As a second-tier Glaive, you have honed your combat skills and tactics, becoming a more formidable warrior on the battlefield.'
),
(
    (SELECT id FROM character_types WHERE name = 'Glaive'),
    3,
    'Third-Tier Glaive',
    'As a third-tier Glaive, you are a seasoned warrior, adept in various combat techniques and strategies, ready to face greater challenges.'
),
(
    (SELECT id FROM character_types WHERE name = 'Glaive'),
    4,
    'Fourth-Tier Glaive',
    'As a fourth-tier Glaive, you are a master of combat, possessing unparalleled skills and tactics that make you a formidable force on the battlefield.'
),
(
    (SELECT id FROM character_types WHERE name = 'Glaive'),
    5,
    'Fifth-Tier Glaive',
    'As a fifth-tier Glaive, you are a legendary warrior, whose combat prowess and tactical genius are renowned across the galaxy.'
),
(
    (SELECT id FROM character_types WHERE name = 'Glaive'),
    6,
    'Sixth-Tier Glaive',
    'As a sixth-tier Glaive, you are an unparalleled warrior, whose mastery of combat and strategy is unmatched, making you a living legend in the annals of galactic history.'
);

INSERT INTO character_types_tier_pool_modifiers (
    character_type_tier_id,
    pool_type,
    modifier_value,
    edge_value
) VALUES (
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 1),
    'EFFORT',
    1,
    0
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 1),
    'SHINS',
    5,
    0
);

INSERT INTO character_types_tier_skills (
    character_type_tier_id,
    skill_id,
    training_level
) VALUES (
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Physical Skills'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Cypher Use'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Practiced in Armour'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Practiced With All Weapons'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Fighting Move Choice Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Fighting Move Choice Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 2),
    (SELECT id FROM skills WHERE name = 'Fighting Move Choice Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 2),
    (SELECT id FROM skills WHERE name = 'Skill With Attacks'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 3),
    (SELECT id FROM skills WHERE name = 'Expert Cypher Use'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 3),
    (SELECT id FROM skills WHERE name = 'Skill With Attacks'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 3),
    (SELECT id FROM skills WHERE name = 'Fighting Move Choice Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 4),
    (SELECT id FROM skills WHERE name = 'Skill With Attacks'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 4),
    (SELECT id FROM skills WHERE name = 'Fighting Move Choice Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 5),
    (SELECT id FROM skills WHERE name = 'Adept Cypher Use'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 5),
    (SELECT id FROM skills WHERE name = 'Skill With Attacks'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 5),
    (SELECT id FROM skills WHERE name = 'Fighting Move Choice Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 6),
    (SELECT id FROM skills WHERE name = 'Skill With Attacks'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 6),
    (SELECT id FROM skills WHERE name = 'Fighting Move Choice Slot'),
    'TRAINED'
);

INSERT INTO character_types_tier_equipment (
    character_type_tier_id,
    equipment_item_id
) VALUES (
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Clothing')
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Explorer''s Pack')
);