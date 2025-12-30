INSERT INTO
    items (
        name,
        description,
        weight,
        price,
        item_type,
        equip_location
    )
VALUES (
        'Greataxe',
        '',
        1.0,
        5.0,
        'WEAPON',
        'HANDS'
    ),
    (
        'Greatsword',
        '',
        1.0,
        5.0,
        'WEAPON',
        'HANDS'
    ),
    (
        'Heavy Crossbow',
        'Long range, more powerful than a standard crossbow but heavier and slower to reload. Action to reload.',
        1.0,
        7.0,
        'WEAPON',
        'HANDS'
    ),
    (
        'Maul',
        '',
        1.0,
        4.0,
        'WEAPON',
        'HANDS'
    ),
    (
        'Sword staff',
        '',
        1.0,
        5.0,
        'WEAPON',
        'HANDS'
    );

INSERT INTO
    weapons (
        item_id,
        capacity,
        capacity_type,
        weight_type
    )
VALUES (
        (SELECT id FROM items WHERE name = 'Greataxe'),
        NULL,
        NULL,
        'HEAVY'
    ),
    (
        (SELECT id FROM items WHERE name = 'Greatsword'),
        NULL,
        NULL,
        'HEAVY'
    ),
    (
        (SELECT id FROM items WHERE name = 'Heavy Crossbow'),
        1,
        'HEAVY_BOLT',
        'HEAVY'
    ),
    (
        (SELECT id FROM items WHERE name = 'Maul'),
        NULL,
        NULL,
        'HEAVY'
    ),
    (
        (SELECT id FROM items WHERE name = 'Sword staff'),
        NULL,
        NULL,
        'HEAVY'
    );