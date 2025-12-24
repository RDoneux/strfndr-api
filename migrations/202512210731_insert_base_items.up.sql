INSERT INTO
    items (
        name,
        item_type,
        source_book
    )
VALUES
    -- Equipment
    (
        'Light Weapon',
        'Equipment',
        'Numenera Core Rulebook (2013)'
    ),
    (
        'Medium Weapon',
        'Equipment',
        'Numenera Core Rulebook (2013)'
    ),
    (
        'Heavy Weapon',
        'Equipment',
        'Numenera Core Rulebook (2013)'
    ),
    (
        'Light Armor',
        'Equipment',
        'Numenera Core Rulebook (2013)'
    ),
    (
        'Medium Armor',
        'Equipment',
        'Numenera Core Rulebook (2013)'
    ),
    (
        'Explorer''s Pack',
        'Equipment',
        'Numenera Core Rulebook (2013)'
    ),
    (
        'Rope (50 ft)',
        'Equipment',
        'Numenera Core Rulebook (2013)'
    ),
    (
        'Bow',
        'Equipment',
        'Numenera Core Rulebook (2013)'
    ),
    (
        'Quiver of Arrows',
        'Equipment',
        'Numenera Core Rulebook (2013)'
    ),
    (
        'Traveler''s Clothes',
        'Equipment',
        'Numenera Core Rulebook (2013)'
    ),

-- Cyphers
(
    'Detonation (Fire)',
    'Cypher',
    'Numenera Core Rulebook (2013)'
),
(
    'Detonation (Gravity)',
    'Cypher',
    'Numenera Core Rulebook (2013)'
),
(
    'Healing Injector',
    'Cypher',
    'Numenera Core Rulebook (2013)'
),
(
    'Mental Enhancement',
    'Cypher',
    'Numenera Core Rulebook (2013)'
),
(
    'Force Field Projector',
    'Cypher',
    'Numenera Core Rulebook (2013)'
),

-- Artifacts
(
    'Plasma Blade',
    'Artifact',
    'Numenera Core Rulebook (2013)'
),
(
    'Hover Belt',
    'Artifact',
    'Numenera Core Rulebook (2013)'
),
(
    'Power Glove',
    'Artifact',
    'Numenera Core Rulebook (2013)'
),

-- Oddities
(
    'Glowing Marble',
    'Oddity',
    'Numenera Core Rulebook (2013)'
),
(
    'Singing Coin',
    'Oddity',
    'Numenera Core Rulebook (2013)'
),
(
    'Color-Shifting Cube',
    'Oddity',
    'Numenera Core Rulebook (2013)'
);

INSERT INTO
    equipment (
        item_id,
        cost,
        weight,
        description
    )
VALUES (
        (SELECT id FROM items WHERE name = 'Light Weapon'),
        3,
        2.0,
        'Light melee weapon such as a dagger or short sword.'
    ),
    (
        (SELECT id FROM items WHERE name = 'Medium Weapon'),
        5,
        4.0,
        'Medium weapon such as a longsword, spear, or mace.'
    ),
    (
        (SELECT id FROM items WHERE name = 'Heavy Weapon'),
        7,
        8.0,
        'Heavy weapon requiring two hands, such as a greatsword or maul.'
    ),
    (
        (SELECT id FROM items WHERE name = 'Light Armor'),
        5,
        8.0,
        'Provides +1 Armor, reduces Speed Effort by 1.'
    ),
    (
        (SELECT id FROM items WHERE name = 'Medium Armor'),
        8,
        12.0,
        'Provides +2 Armor, reduces Speed Effort by 2.'
    ),
    (
        (SELECT id FROM items WHERE name = 'Explorer''s Pack'),
        3,
        10.0,
        'Contains rations, water, torches, bedroll, and basic adventuring tools.'
    ),
    (
        (SELECT id FROM items WHERE name = 'Rope (50 ft)'),
        1,
        3.0,
        '50 feet of sturdy rope, can support a person\'s weight.'
    ),
    (
        (SELECT id FROM items WHERE name = 'Bow'),
        5,
        3.0,
        'Medium-ranged bow, requires ammunition.'
    ),
    (
        (SELECT id FROM items WHERE name = 'Quiver of Arrows'),
        1,
        2.0,
        'Holds 20 arrows for a bow or crossbow.'
    ),
    (
        (SELECT id FROM items WHERE name = 'Traveler''s Clothes'),
        2,
        2.0,
        'Practical, comfortable clothing suitable for travel.'
    );

INSERT INTO
    cyphers (
        item_id,
        level,
        effect,
        cypher_type
    )
VALUES (
        (SELECT id FROM items WHERE name = 'Detonation (Fire)'),
        5,
        'Creates an explosion of fire in a small area.',
        'Anoetic'
    ),
    (
        (SELECT id FROM items WHERE name = 'Detonation (Gravity)'),
        5,
        'Generates a localized gravitational distortion.',
        'Anoetic'
    ),
    (
        (SELECT id FROM items WHERE name = 'Healing Injector'),
        3,
        'Restores health equal to the cypher\'s level when injected.',
        'Anoetic'
    ),
    (
        (SELECT id FROM items WHERE name = 'Mental Enhancement'),
        4,
        'Temporarily boosts mental acuity or intellect tasks.',
        'Occultic'
    ),
    (
        (SELECT id FROM items WHERE name = 'Force Field Projector'),
        6,
        'Projects a temporary protective energy field.',
        'Occultic'
    );

INSERT INTO
    artifacts (
        item_id,
        level,
        effect,
        depletion
    )
VALUES (
        (SELECT id FROM items WHERE name = 'Plasma Blade'),
        7,
        'A melee weapon of coherent plasma energy that deals intense heat damage.',
        '1 in 1d20'
    ),
    (
        (SELECT id FROM items WHERE name = 'Hover Belt'),
        5,
        'Allows the wearer to hover a short distance above the ground.',
        '1 in 1d100'
    ),
    (
        (SELECT id FROM items WHERE name = 'Power Glove'),
        6,
        'Enhances physical strength when striking or lifting objects.',
        '1 in 1d20'
    );

INSERT INTO
    oddities (item_id, description)
VALUES (
        (SELECT id FROM items WHERE name = 'Glowing Marble'),
        'A marble that glows faintly when submerged in water.'
    ),
    (
        (SELECT id FROM items WHERE name = 'Singing Coin'),
        'A coin that hums softly when flipped.'
    ),
    (
        (SELECT id FROM items WHERE name = 'Color-Shifting Cube'),
        'A small cube that constantly changes color in slow pulses.'
    );