INSERT INTO
    character_types (
        id,
        name,
        description,
        source_book,
        special_effect
    )
VALUES (
        '8c606521-ce04-4725-ade4-e342768b266f',
        'Glaive',
        'Warrior, combat specialist. Focused on physical feats and fighting prowess.',
        'Numenera Core Rulebook (2013)',
        'Abilities that enhance melee combat and defense.'
    ),
    (
        'b1f5d6e2-3c4a-4f7a-9f4b-2d5e8c9a1b2c',
        'Nano',
        'Scientist or magic user. Focused on powers, esoteries, and Numenera.',
        'Numenera Core Rulebook (2013)',
        'Abilities that manipulate environment, Numenera, or esoteric powers.'
    ),
    (
        'd3f9e8b7-5a6c-4d2e-9f1b-3c4d5e6f7a8b',
        'Jack',
        'Flexible generalist. Adaptable and resourceful, capable in a variety of tasks.',
        'Numenera Core Rulebook (2013)',
        'Versatile abilities emphasizing flexibility and creative problem solving.'
    );

INSERT INTO
    character_types_pool_modifiers (
        id,
        type_id,
        pool_type,
        modifier_value
    )
VALUES
    -- Glaive
    (
        '5f34820c-8226-4206-8bad-95f1e6be22ba',
        '8c606521-ce04-4725-ade4-e342768b266f',
        'Might',
        11
    ),
    (
        'c49b5483-8173-470c-96e6-4f742dcea1b6',
        '8c606521-ce04-4725-ade4-e342768b266f',
        'Speed',
        10
    ),
    (
        '6cc43ce8-bbc8-4817-97f5-a86d33800b22',
        '8c606521-ce04-4725-ade4-e342768b266f',
        'Intellect',
        7
    ),

-- Nano
(
    'a1163b1b-dd5b-4a99-b528-290a4c534ff8',
    'b1f5d6e2-3c4a-4f7a-9f4b-2d5e8c9a1b2c',
    'Might',
    7
),
(
    'f65b0be9-beb9-4a01-ab76-28537d2ac2d8',
    'b1f5d6e2-3c4a-4f7a-9f4b-2d5e8c9a1b2c',
    'Speed',
    9
),
(
    '41c48a27-c355-4ad8-bc50-cfff7edbb3c6',
    'b1f5d6e2-3c4a-4f7a-9f4b-2d5e8c9a1b2c',
    'Intellect',
    12
),

-- Jack
(
    '5d9b4c04-05a4-4420-bebc-8a4b57655b74',
    'd3f9e8b7-5a6c-4d2e-9f1b-3c4d5e6f7a8b',
    'Might',
    10
),
(
    '63cd2f43-3015-4330-a297-5ec27d62ea0f',
    'd3f9e8b7-5a6c-4d2e-9f1b-3c4d5e6f7a8b',
    'Speed',
    10
),
(
    'f2a072d7-aaed-41bc-af44-6e0f04a556db',
    'd3f9e8b7-5a6c-4d2e-9f1b-3c4d5e6f7a8b',
    'Intellect',
    10
);

INSERT INTO
    character_types_trainings (
        id,
        type_id,
        skill_id,
        training_level
    )
VALUES
    -- Glaive
    (
        '33b8e039-3e78-4586-8b7f-088261d2ee40',
        '8c606521-ce04-4725-ade4-e342768b266f',
        '7368d90c-52d7-4117-b899-fd4124992825',
        'Trained'
    ), -- Dodging (Speed Defense analogue)
    (
        '871d595c-f267-4006-89f0-80f5461d9820',
        '8c606521-ce04-4725-ade4-e342768b266f',
        '28bf7d87-d5d4-4484-a359-bc1f31eadc94',
        'Trained'
    ), -- Breaking Things (Might Defense analogue)

-- Nano
(
    '6547221d-9978-4bb3-a8ff-203c8f6717da',
    'b1f5d6e2-3c4a-4f7a-9f4b-2d5e8c9a1b2c',
    '9676df7f-7c53-4615-9fbd-8ba0b843822d',
    'Trained'
), -- Understanding Numenera
(
    'cefc52bf-6dbc-4e56-b20d-a59f1c106175',
    'b1f5d6e2-3c4a-4f7a-9f4b-2d5e8c9a1b2c',
    'a1fadd3a-fda6-4fe0-bfd9-2b7955f1fe18',
    'Trained'
), -- Esoteries

-- Jack
(
    '19a57bae-557b-450a-b704-88071967bd3d',
    'd3f9e8b7-5a6c-4d2e-9f1b-3c4d5e6f7a8b',
    '83488d7f-12f3-42d4-8306-9b10060cefc9',
    'Trained'
), -- Trickery
(
    '8c41aa36-6191-4ccd-ba7b-7dac84cb5d32',
    'd3f9e8b7-5a6c-4d2e-9f1b-3c4d5e6f7a8b',
    '41b3b54a-10e5-42e8-9e41-a866a7de8d1a',
    'Trained'
);
-- Movement Tasks

INSERT INTO
    character_types_inabilities (id, type_id, skill_id)
VALUES
    -- Glaive: Hindered on Intellect-related tasks
    (
        '4e792804-a2f3-4ed9-afa5-42420fde76fd',
        '8c606521-ce04-4725-ade4-e342768b266f',
        'c2c41c35-08c1-405e-a815-4ade46b5d814'
    ), -- Knowledge Tasks
    (
        'ccf2583a-c4f5-45c5-9d96-b0cd8d2bcbcc',
        '8c606521-ce04-4725-ade4-e342768b266f',
        'bc35bef9-cc78-402a-8fc2-0b414f24ad38'
    ), -- Persuasion
    (
        '542c1354-f906-4427-9e16-f418b00f6056',
        '8c606521-ce04-4725-ade4-e342768b266f',
        'c137b5da-694c-4a13-bf82-1cc53643b813'
    ), -- Pleasant Social Interactions

-- Nano: Hindered on Might and Speed-based physical tasks
(
    '1d10fc08-c1a1-4f20-831e-068aa9870122',
    'b1f5d6e2-3c4a-4f7a-9f4b-2d5e8c9a1b2c',
    'b4c62b59-617b-4df9-b1ce-697150888451'
), -- Climbing
(
    'f304f390-51dd-4e3c-8c08-c42046d374d1',
    'b1f5d6e2-3c4a-4f7a-9f4b-2d5e8c9a1b2c',
    'da252ed8-61e4-4d7a-9e17-8cb7dc02ce99'
), -- Balancing
(
    '65c5c5a3-1b2f-4091-9d7d-4f6ff33bc978',
    'b1f5d6e2-3c4a-4f7a-9f4b-2d5e8c9a1b2c',
    'eacf63f8-c5c0-4dd3-b636-a6369273087b'
), -- Jumping
(
    '6061218e-cd1b-4348-8140-74f1cbec73df',
    'b1f5d6e2-3c4a-4f7a-9f4b-2d5e8c9a1b2c',
    '7368d90c-52d7-4117-b899-fd4124992825'
), -- Dodging
(
    '15c7f989-3c39-4016-92f2-99e420ca1df6',
    'b1f5d6e2-3c4a-4f7a-9f4b-2d5e8c9a1b2c',
    '28bf7d87-d5d4-4484-a359-bc1f31eadc94'
); -- Breaking Things