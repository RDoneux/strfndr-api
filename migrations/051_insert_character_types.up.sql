INSERT INTO
    character_types (
        name,
        description,
        source_book,
        special_effect
    )
VALUES (
        'Glaive',
        'Warrior, combat specialist. Focused on physical feats and fighting prowess.',
        'Numenera Core Rulebook (2013)',
        'Abilities that enhance melee combat and defense.'
    ),
    (
        'Nano',
        'Scientist or magic user. Focused on powers, esoteries, and Numenera.',
        'Numenera Core Rulebook (2013)',
        'Abilities that manipulate environment, Numenera, or esoteric powers.'
    ),
    (
        'Jack',
        'Flexible generalist. Adaptable and resourceful, capable in a variety of tasks.',
        'Numenera Core Rulebook (2013)',
        'Versatile abilities emphasizing flexibility and creative problem solving.'
    );

INSERT INTO
    character_types_pool_modifiers (
        type_id,
        pool_type,
        modifier_value,
        edge_value
    )
VALUES
    -- Glaive
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        'Might',
        11,
        1
    ),
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        'Speed',
        10,
        1
    ),
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        'Intellect',
        7,
        0
    ),

-- Nano
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    'Might',
    7,
    0
),
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    'Speed',
    9,
    0
),
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    'Intellect',
    12,
    1
),

-- Jack
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    'Might',
    10,
    0
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    'Speed',
    10,
    1
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    'Intellect',
    10,
    0
);

INSERT INTO
    character_types_trainings (
        type_id,
        skill_id,
        training_level
    )
VALUES
    -- Glaive
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        (SELECT id FROM skills WHERE name = 'Dodging'),
        'Trained'
    ), -- Dodging (Speed Defense analogue)
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        (SELECT id FROM skills WHERE name = 'Breaking Things'),
        'Trained'
    ), -- Breaking Things (Might Defense analogue)

-- Nano
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    (SELECT id FROM skills WHERE name = 'Understanding Numenera'),
    'Trained'
), -- Understanding Numenera
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    (SELECT id FROM skills WHERE name = 'Esoteries'),
    'Trained'
), -- Esoteries

-- Jack
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    (SELECT id FROM skills WHERE name = 'Trickery'),
    'Trained'
), -- Trickery
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    (SELECT id FROM skills WHERE name = 'Movement Tasks'),
    'Trained'
);
-- Movement Tasks

INSERT INTO
    character_types_inabilities (type_id, skill_id)
VALUES
    -- Glaive: Hindered on Intellect-related tasks
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        (SELECT id FROM skills WHERE name = 'Knowledge Tasks')
    ), -- Knowledge Tasks
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        (SELECT id FROM skills WHERE name = 'Persuasion')
    ), -- Persuasion
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        (SELECT id FROM skills WHERE name = 'Pleasant Social Interactions')
    ), -- Pleasant Social Interactions

-- Nano: Hindered on Might and Speed-based physical tasks
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    (SELECT id FROM skills WHERE name = 'Climbing')
), -- Climbing
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    (SELECT id FROM skills WHERE name = 'Balancing')
), -- Balancing
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    (SELECT id FROM skills WHERE name = 'Jumping')
), -- Jumping
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    (SELECT id FROM skills WHERE name = 'Dodging')
), -- Dodging
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    (SELECT id FROM skills WHERE name = 'Breaking Things')
); -- Breaking Things

INSERT INTO
    character_types_equipment (
        type_id,
        item_id,
        description
    )
VALUES
    -- GLAIVE
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        (SELECT id FROM items WHERE name = 'Medium Weapon'),
        'Medium Weapon'
    ),
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        (SELECT id FROM items WHERE name = 'Heavy Weapon'),
        'Heavy Weapon'
    ),
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        (SELECT id FROM items WHERE name = 'Medium Armor'),
        'Medium Armor'
    ),
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        (SELECT id FROM items WHERE name = 'Explorer’s Pack'),
        'Explorer’s Pack'
    ),
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        (SELECT id FROM items WHERE name = 'Detonation (Fire)'),
        'Cypher: Detonation (Fire)'
    ),
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        (SELECT id FROM items WHERE name = 'Detonation (Gravity)'),
        'Cypher: Detonation (Gravity)'
    ),
    (
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        (SELECT id FROM items WHERE name = 'Glowing Marble'),
        'Oddity: Glowing Marble'
    ),

-- NANO
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    (SELECT id FROM items WHERE name = 'Traveler’s Clothes'),
    'Traveler’s Clothes'
),
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    (SELECT id FROM items WHERE name = 'Light Weapon'),
    'Light Weapon'
),
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    (SELECT id FROM items WHERE name = 'Mental Enhancement'),
    'Cypher: Mental Enhancement'
),
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    (SELECT id FROM items WHERE name = 'Healing Injector'),
    'Cypher: Healing Injector'
),
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    (SELECT id FROM items WHERE name = 'Singing Coin'),
    'Oddity: Singing Coin'
),

-- JACK
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    (SELECT id FROM items WHERE name = 'Light Weapon'),
    'Light Weapon'
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    (SELECT id FROM items WHERE name = 'Light Armor'),
    'Light Armor'
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    (SELECT id FROM items WHERE name = 'Explorer’s Pack'),
    'Explorer’s Pack'
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    (SELECT id FROM items WHERE name = 'Force Field Projector'),
    'Cypher: Force Field Projector'
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    (SELECT id FROM items WHERE name = 'Detonation (Fire)'),
    'Cypher: Detonation (Fire)'
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    (SELECT id FROM items WHERE name = 'Color-Shifting Cube'),
    'Oddity: Color-Shifting Cube'
);