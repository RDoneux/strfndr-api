INSERT INTO
    characters (
        name,
        descriptor_id,
        type_id,
        focus_id
    )
VALUES (
        'Test Character',
        (SELECT id FROM character_descriptors WHERE name = 'Swift'),
        (SELECT id FROM character_types WHERE name = 'Jack'),
        (SELECT id FROM character_focus WHERE name = 'Masters Defense')
    )