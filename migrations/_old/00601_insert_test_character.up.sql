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
        (SELECT id FROM character_types WHERE name = 'Glaive'),
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        6
    )