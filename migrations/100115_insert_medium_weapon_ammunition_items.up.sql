INSERT INTO items (
    name,
    description,
    weight,
    price,
    item_type
) VALUES 
    (
        'Arrow',
        'A standard projectile used with bows.',
        1.0,
        0.40,
        'AMMUNITION'
    ),
    (
        'Bolt',
        'A sturdy projectile used with crossbows.',
        1.0,
        0.40,
        'AMMUNITION'
    );

INSERT INTO ammunition (
    item_id,
    type
) VALUES 
    (
        (SELECT id FROM items WHERE name = 'Arrow'),
        'ARROW'
    ),
    (
        (SELECT id FROM items WHERE name = 'Bolt'),
        'BOLT'
    );