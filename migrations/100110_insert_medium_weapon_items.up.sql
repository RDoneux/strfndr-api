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
        'Battleaxe',
        '',
        1.0,
        3,
        'WEAPON',
        'HANDS'
    ),
    (
        'Bow',
        'Long range',
        1.0,
        3,
        'WEAPON',
        'HANDS'
    ),
    (
        'Broadsword',
        '',
        1.0,
        3,
        'WEAPON',
        'HANDS'
    ),
    (
        'Crank Crossbow',
        'This long ragne weapon is similar to a standard crossbow, but it has a magazine that holds five bolts. Action to reload, it can be used as a rapid-fire weapon',
        1.0,
        10,
        'WEAPON',
        'HANDS'
    ),
    (
        'Crossbow',
        'Long range',
        1.0,
        5,
        'WEAPON',
        'HANDS'
    ),
    (
        'Flail',
        '',
        1.0,
        3,
        'WEAPON',
        'HANDS'
    ),
    (
        'Hammer',
        '',
        1.0,
        2,
        'WEAPON',
        'HANDS'
    ),
    (
        'Javelin',
        'Long range',
        1.0,
        2,
        'WEAPON',
        'HANDS'
    ),
    (
        'Mace',
        '',
        1.0,
        2,
        'WEAPON',
        'HANDS'
    ),
    (
        'Polearm',
        'Often used two-handed',
        1.0,
        3,
        'WEAPON',
        'HANDS'
    ),
    (
        'Quarterstaff',
        'Often used two-handed',
        1.0,
        2,
        'WEAPON',
        'HANDS'
    ),
    (
        'Spear',
        'Can be thrown up to long range',
        1.0,
        2,
        'WEAPON',
        'HANDS'
    ),
    (
        'Verred',
        'This weapon resembles a sword with two forked blades. It is short and useful in defence as well as offence.',
        1.0,
        2,
        'WEAPON',
        'HANDS'
    ),
    (
        'Yulk',
        'This weapon resembles a splayed metal claw mounted upon a .6-meter haft. It is used mainly by raiders and wildmen of the beyond.',
        1.0,
        2,
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
        (SELECT id FROM items WHERE name = 'Battleaxe'),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Bow'),
        1,
        'ARROW',
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Broadsword'),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Crank Crossbow'),
        5,
        'BOLT',
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Crossbow'),
        1,
        'BOLT',
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Flail'),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Hammer'),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Javelin'),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Mace'),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Polearm'),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Quarterstaff'),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Spear'),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Verred'),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Yulk'),
        NULL,
        NULL,
        'MEDIUM'
    );