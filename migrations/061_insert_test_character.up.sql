INSERT INTO
    characters (
        name,
        descriptor_id,
        type_id,
        focus_id,
        tier
    )
VALUES (
        'Test Character',
        (SELECT id FROM character_descriptors WHERE name = 'Swift'),
        (SELECT id FROM character_types WHERE name = 'Nano'),
        (SELECT id FROM character_focus WHERE name = 'Commands Mental Powers'),
        3
    )