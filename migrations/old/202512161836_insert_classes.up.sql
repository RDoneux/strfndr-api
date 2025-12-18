-- CREATE SOME CLASSES
INSERT INTO
    classes (
        id,
        name,
        description,
        key_ability_score,
        hit_points_per_level,
        traits
    )
VALUES (
        '5ffee6f4-096a-4500-8fd2-f4cc560a1b7e',
        'Envoy',
        'The Envoy is a master of communication and tactics, inspiring allies and outmaneuvering foes.',
        'Charisma',
        8,
        'Envoy, Class'
    ),
    (
        'c2573746-c9e8-4e15-9d03-65f166981546',
        'Soldier',
        'The Soldier is a combat expert, excelling in weapons and armor, and taking the front line in battle.',
        'Strength',
        10,
        'Soldier, Class'
    ),
    (
        'fd06bec1-be43-4320-90a2-7ce1bacba5f8',
        'Technomancer',
        'The Technomancer combines technology and magic to manipulate the battlefield with spells and devices.',
        'Intelligence',
        6,
        'Technomancer, Class'
    );

-- ASSIGN A CLASS TO THE TEST CHARACTER
UPDATE
    characters
SET
    class_id = 'c2573746-c9e8-4e15-9d03-65f166981546'
WHERE
    id = 'a1b2c3d4-e5f6-7890-abcd-ef0123456789';