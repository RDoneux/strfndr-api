INSERT INTO
    items (
        name,
        description,
        weight,
        price,
        item_type
    )
VALUES (
        'Battleaxe',
        '',
        1.0,
        3,
        'WEAPON'
    ),
    (
        'Bow',
        'Long range',
        1.0,
        3,
        'WEAPON'
    ),
    (
        'Broadsword',
        '',
        1.0,
        3,
        'WEAPON'
    ),
    (
        'Crank Crossbow',
        'This long ragne weapon is similar to a standard crossbow, but it has a magazine that holds five bolts. Action to reload, it can be used as a rapid-fire weapon',
        1.0,
        10,
        'WEAPON'
    ),
    (
        'Crossbow',
        'Long range',
        1.0,
        5,
        'WEAPON'
    ),
    ('Flail', '', 1.0, 3, 'WEAPON'),
    (
        'Hammer',
        '',
        1.0,
        2,
        'WEAPON'
    ),
    (
        'Javelin',
        'Long range',
        1.0,
        2,
        'WEAPON'
    ),
    ('Mace', '', 1.0, 2, 'WEAPON'),
    (
        'Polearm',
        'Often used two-handed',
        1.0,
        3,
        'WEAPON'
    ),
    (
        'Quarterstaff',
        'Often used two-handed',
        1.0,
        2,
        'WEAPON'
    ),
    (
        'Spear',
        'Can be thrown up to long range',
        1.0,
        2,
        'WEAPON'
    ),
    (
        'Verred',
        'This weapon resembles a sword with two forked blades. It is short and useful in defence as well as offence.',
        1.0,
        2,
        'WEAPON'
    ),
    (
        'Yulk',
        'This weapon resembles a splayed metal claw mounted upon a .6-meter haft. It is used mainly by raiders and wildmen of the beyond.',
        1.0,
        2,
        'WEAPON'
    );

INSERT INTO
    weapons (
        item_id,
        capacity,
        capacity_type,
        weight_type
    )
VALUES (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Battleaxe'
        ),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Bow'
        ),
        1,
        'ARROW',
        'MEDIUM'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Broadsword'
        ),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Crank Crossbow'
        ),
        5,
        'BOLT',
        'MEDIUM'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Crossbow'
        ),
        1,
        'BOLT',
        'MEDIUM'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Flail'
        ),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Hammer'
        ),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Javelin'
        ),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Mace'
        ),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Polearm'
        ),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Quarterstaff'
        ),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Spear'
        ),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Verred'
        ),
        NULL,
        NULL,
        'MEDIUM'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Yulk'
        ),
        NULL,
        NULL,
        'MEDIUM'
    );

INSERT INTO
    item_equip_locations (item_id, equip_location)
VALUES (
        (
            SELECT id
            FROM items
            WHERE
                name = "Battleaxe"
        ),
        "HANDS"
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = "Bow"
        ),
        "HANDS"
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = "Broadsword"
        ),
        "HANDS"
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = "Crank Crossbow"
        ),
        "HANDS"
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = "Crossbow"
        ),
        "HANDS"
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = "Flail"
        ),
        "HANDS"
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = "Hammer"
        ),
        "HANDS"
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = "Javelin"
        ),
        "HANDS"
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = "Mace"
        ),
        "HANDS"
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = "Polearm"
        ),
        "HANDS"
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = "Quarterstaff"
        ),
        "HANDS"
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = "Spear"
        ),
        "HANDS"
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = "Verred"
        ),
        "HANDS"
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = "Yulk"
        ),
        "HANDS"
    );