INSERT INTO character_types_tiers (
    character_type_id,
    tier,
    name,
    description
) VALUES (
    (SELECT id FROM character_types WHERE name = 'Nano'),
    1,
    'First-Tier Nano',
    'As a first-tier Nano, you have begun your journey into the world of nanotechnology and psionics, gaining basic abilities to manipulate the world around you.'
),
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    2,
    'Second-Tier Nano',
    'As a second-tier Nano, you have advanced your understanding of nanotechnology and psionics, unlocking more powerful abilities to influence your environment and others.'
),
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    3,
    'Third-Tier Nano',
    'As a third-tier Nano, you are a skilled practitioner of nanotechnology and psionics, capable of wielding significant power to alter reality and affect those around you.'
),
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    4,
    'Fourth-Tier Nano',
    'As a fourth-tier Nano, you are a master of nanotechnology and psionics, possessing extraordinary abilities to manipulate matter and energy at a fundamental level.'
),
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    5,
    'Fifth-Tier Nano',
    'As a fifth-tier Nano, you are a legendary figure in the realm of nanotechnology and psionics, whose powers are revered and feared across the galaxy.'
),
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    6,
    'Sixth-Tier Nano',
    'As a sixth-tier Nano, you are an unparalleled master of nanotechnology and psionics, whose abilities transcend conventional understanding, making you a living legend in the annals of galactic history.'
);

INSERT INTO character_types_tier_pool_modifiers (
    character_type_tier_id,
    pool_type,
    modifier_value,
    edge_value
) VALUES (
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 1),
    'EFFORT',
    1,
    0
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 1),
    'INTELLECT',
    12,
    1
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 2),
    'MIGHT',
    7,
    0
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 2),
    'SPEED',
    9,
    0
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 2),
    'SHINS',
    4,
    0
);

INSERT INTO character_types_tier_skills (
    character_type_tier_id,
    skill_id,
    training_level
) VALUES (
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Expert Cypher Use'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Practiced With Light Weapons'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Numenera Training'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Esotery Choice Slot'),
    'TRAINED'
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 1),
    (SELECT id FROM skills WHERE name = 'Esotery Choice Slot'),
    'TRAINED'
);

INSERT INTO character_types_tier_equipment (
    character_type_tier_id,
    equipment_item_id
) VALUES (
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Clothing')
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Light Weapon Slot')
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Book')
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Cypher Slot')
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Cypher Slot')
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Cypher Slot')
),
(
    (SELECT ctt.id FROM character_types_tiers ctt JOIN character_types ct ON ctt.character_type_id = ct.id WHERE ct.name = 'Nano' AND ctt.tier = 1),
    (SELECT id FROM items WHERE name = 'Oddity Slot')
);