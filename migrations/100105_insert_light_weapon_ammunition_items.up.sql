INSERT INTO items (
    name,
    description,
    weight,
    price,
    item_type
) VALUES 
    (
        'Dart',
        'A small, pointed projectile that can be thrown or fired from a blowgun or dart thrower.',
        1.0,
        0.25,
        'AMMUNITION'
    ),
    (
        '5-disk buzzer magazine',
        'A magazine holding 5 bladed disks for use with a buzzer weapon.',
        1.0,
        1,
        'AMMUNITION'
    );

INSERT INTO ammunitions (
    item_id,
    type
) VALUES 
    (
        (SELECT id FROM items WHERE name = 'Dart'),
        'DART'
    ),
    (
        (SELECT id FROM items WHERE name = '5-disk buzzer magazine'),
        'BUZZER_MAGAZINE'
    );