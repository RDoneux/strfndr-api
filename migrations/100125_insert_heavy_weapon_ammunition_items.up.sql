INSERT INTO
    items (
        name,
        description,
        weight,
        price,
        item_type
    )
VALUES (
        'Heavy Bolt',
        'A large, powerful projectile used with heavy crossbows.',
        1.0,
        0.40,
        'AMMUNITION'
    );

INSERT INTO
    ammunitions (item_id, type)
VALUES (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Heavy Bolt'
        ),
        'HEAVY_BOLT'
    );