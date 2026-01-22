INSERT INTO
    items (
        name,
        description,
        price,
        item_type
    )
VALUES (
        'Oddity Slot',
        'A slot for an oddity to be equipped.',
        0,
        'ODDITY_SLOT'
    );

INSERT INTO
    item_equip_locations (item_id, equip_location)
VALUES (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Oddity Slot'
        ),
        'NONE'
    );