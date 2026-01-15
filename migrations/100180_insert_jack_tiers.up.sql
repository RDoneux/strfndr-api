INSERT INTO character_types_tiers (
    character_type_id,
    tier,
    name,
    description
) VALUES (
    (SELECT id FROM character_types WHERE name = 'Jack'),
    1,
    'Jack Tier 1',
    'Jack of all trades, master of none.'
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    2,
    'Jack Tier 2',
    'Jack of all trades, master of none.'
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    3,
    'Jack Tier 3',
    'Jack of all trades, master of none.'
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    4,
    'Jack Tier 4',
    'Jack of all trades, master of none.'
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    5,
    'Jack Tier 5',
    'Jack of all trades, master of none.'
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    6,
    'Jack Tier 6',
    'Jack of all trades, master of none.'
);

INSERT INTO character_types_tier_pool_modifiers (
    character_type_tier_id,
    pool_type,
    modifier_value,
    edge_value
) VALUES 
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 1),
    'EFFORT',
    1,
    0
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 1),
    'SHINS',
    8,
    0
);

INSERT INTO character_types_tier_equipment (
    character_type_tier_id,
    equipment_item_id
) VALUES (
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Clothing')
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Light Weapon Slot' )
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Light Weapon Slot' )
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Back of light tools' )
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Light Armour Slot' )
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Explorer''s Pack' )
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 2),
    (SELECT id FROM items WHERE name = 'Cypher Slot' )
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 2),
    (SELECT id FROM items WHERE name = 'Cypher Slot' )
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 3),
    (SELECT id FROM items WHERE name = 'Oddity Slot' )
);


INSERT INTO character_types_tier_skills (
    character_type_tier_id,
    skill_id,
    training_level
) VALUES (
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Cypher Use'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Practiced With Light Weapons'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Practiced With Medium Weapons'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Trick of the Trade Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Trick of the Trade Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 2),
    (SELECT id FROM skills WHERE name = 'Skill Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 2),
    (SELECT id FROM skills WHERE name = 'Trick of the Trade Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 3),
    (SELECT id FROM skills WHERE name = 'Expert Cypher Use'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 3),
    (SELECT id FROM skills WHERE name = 'Skill Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 3),
    (SELECT id FROM skills WHERE name = 'Trick of the Trade Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 4),
    (SELECT id FROM skills WHERE name = 'Skill Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 4),
    (SELECT id FROM skills WHERE name = 'Trick of the Trade Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 5),
    (SELECT id FROM skills WHERE name = 'Adept Cypher Use'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 5),
    (SELECT id FROM skills WHERE name = 'Skill Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 5),
    (SELECT id FROM skills WHERE name = 'Trick of the Trade Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 6),
    (SELECT id FROM skills WHERE name = 'Skill Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Jack' AND ctt.tier = 6),
    (SELECT id FROM skills WHERE name = 'Trick of the Trade Slot'),
    'TRAINED'
);