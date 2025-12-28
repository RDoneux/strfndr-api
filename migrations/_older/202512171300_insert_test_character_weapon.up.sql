INSERT INTO ranged_weapons (
    character_id,
    name,
    `range`,
    damage,
    capacity,
    `usage`,
    is_magnetic,
    is_experimental,
    weight,
    category,
    type
) VALUES (
    'a1b2c3d4-e5f6-7890-abcd-ef0123456789',
    'Semi-Auto Pistol',
    '30ft',
    '1d6 P (Piercing)',
    '9 (bullets)',
    '1 (per shot)',
    FALSE,
    FALSE,
    2.5,
    'Small Arm',
    'Projectile'
),
(
    'a1b2c3d4-e5f6-7890-abcd-ef0123456789',
    'Vibroblade',
    'Melee (adjacent)',
    '1d8 S (Slashing)',
    NULL,
    NULL,
    FALSE,
    FALSE,
    8.0,
    'Small Arm',
    'Melee'
);