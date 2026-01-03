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
    'MIGHT',
    0,
    1
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Glaive' AND ctt.tier = 1),
    'SPEED',
    0,
    1
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