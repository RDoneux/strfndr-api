INSERT INTO
    character_descriptors (
        id,
        name,
        description,
        source_book,
        special_effect
    )
VALUES (
        '618e8216-6627-422a-8329-ba3ec4abb3eb',
        'Charming',
        'You’re personable, charismatic, and socially adept. You’re good at getting people to like you, convincing them of your point of view, or smoothing over tense situations.',
        'Numenera Core Rulebook (2013)',
        'Once per day, reroll one failed persuasion or similar social roll.'
    ),
    (
        'e4cdf650-fedc-4afb-9006-e12a40217cc1',
        'Clever',
        'You’re inventive, resourceful, and quick-thinking. You come up with creative solutions and enjoy solving puzzles and problems.',
        'Numenera Core Rulebook (2013)',
        NULL
    ),
    (
        '13c28838-33d2-4899-b6e5-d7650c12a531',
        'Graceful',
        'You move with natural coordination and poise. You’re agile and quick, excelling at physical tasks that require balance or speed.',
        'Numenera Core Rulebook (2013)',
        NULL
    ),
    (
        'e9ae81a7-66a4-40d5-9c22-888710b9f0e3',
        'Intelligent',
        'You’re well-educated and logical, comfortable with complex reasoning and problem-solving. You analyze and plan before you act.',
        'Numenera Core Rulebook (2013)',
        NULL
    ),
    (
        'b0b9e855-97dc-4786-a4b9-a0a3c6ab2149',
        'Learned',
        'You have extensive academic or practical knowledge, whether from study, teaching, or hands-on experience.',
        'Numenera Core Rulebook (2013)',
        'Choose two areas of knowledge to be trained in.'
    ),
    (
        'fe6eb862-2a8d-47f5-a7cd-335e80dbaed9',
        'Mechanical',
        'You understand how machines, devices, and numenera function and fit together. You are curious about how things work and often take them apart.',
        'Numenera Core Rulebook (2013)',
        'You can attempt to repair or craft simple devices without tools (if materials are available).'
    ),
    (
        '48b0a8c7-5808-4d3d-af89-f000d7e6e5df',
        'Mystical',
        'You have a connection to unseen forces, mysterious energies, or the numenera itself. Others may see you as a sorcerer, priest, or psychic.',
        'Numenera Core Rulebook (2013)',
        'Trained in understanding esoteries and numenera.'
    ),
    (
        '35017c2d-09a3-41c3-82ff-3a4c7b34e323',
        'Strong',
        'You rely on physical power and endurance. You are a natural athlete or laborer, capable of great feats of strength.',
        'Numenera Core Rulebook (2013)',
        NULL
    ),
    (
        'df03c2cb-2695-4e44-8d9b-faa47bd3fe13',
        'Strong-Willed',
        'Your mind is disciplined and resilient. You are hard to manipulate, intimidate, or frighten.',
        'Numenera Core Rulebook (2013)',
        NULL
    ),
    (
        'dc18661d-9c7c-42e2-b8b0-e987b780817c',
        'Swift',
        'You are faster than average, able to move, react, and strike before others.',
        'Numenera Core Rulebook (2013)',
        'You move 10% farther than normal when taking a move action.'
    ),
    (
        'e6263109-ab19-4781-a0a0-06a2f6db99a2',
        'Tough',
        'You’re physically durable and able to withstand hardship, fatigue, and pain.',
        'Numenera Core Rulebook (2013)',
        'Your first recovery roll each day is one step faster (1 action instead of 10 minutes).'
    ),
    (
        'be273a99-dcf7-4430-a314-d82b7a20dc19',
        'Stealthy',
        'You are skilled at moving unseen and unheard. You know how to blend into crowds or vanish into shadows.',
        'Numenera Core Rulebook (2013)',
        NULL
    ),
    (
        'ed6790cb-da07-467d-8ca4-00ca3a5e10b1',
        'Intuitive',
        'You rely on gut feelings and insight rather than study or logic. You often sense what others miss.',
        'Numenera Core Rulebook (2013)',
        'Once per day, you can reroll a failed Intellect roll involving perception or insight.'
    ),
    (
        'd788a73c-d9aa-4e01-b02e-a192e8f03a87',
        'Kind',
        'You’re compassionate, friendly, and generous. You prefer helping others and avoid violence when possible.',
        'Numenera Core Rulebook (2013)',
        NULL
    ),
    (
        'e55726d5-9e52-4c31-a1cd-d4ed48769e97',
        'Vicious',
        'You are cruel and fierce, often intimidating or hurting others to get what you want. You can be ruthless when necessary.',
        'Numenera Core Rulebook (2013)',
        'You deal +1 damage in melee attacks.'
    ),
    (
        '26e0bb4a-74e5-4a69-a641-83303da171ca',
        'Cautious',
        'You are careful, deliberate, and methodical. You avoid taking risks without preparation.',
        'Numenera Core Rulebook (2013)',
        'You can spend 1 extra round examining a situation to reduce its task difficulty by one step once per scene.'
    );

--

INSERT INTO
    character_descriptor_pool_modifiers (
        descriptor_id,
        pool_type,
        modifier_value
    )
VALUES (
        '618e8216-6627-422a-8329-ba3ec4abb3eb',
        'Intellect',
        2
    ),
    (
        'e4cdf650-fedc-4afb-9006-e12a40217cc1',
        'Intellect',
        2
    ),
    (
        '13c28838-33d2-4899-b6e5-d7650c12a531',
        'Speed',
        2
    ),
    (
        'e9ae81a7-66a4-40d5-9c22-888710b9f0e3',
        'Intellect',
        4
    ),
    (
        'b0b9e855-97dc-4786-a4b9-a0a3c6ab2149',
        'Intellect',
        2
    ),
    (
        'fe6eb862-2a8d-47f5-a7cd-335e80dbaed9',
        'Intellect',
        2
    ),
    (
        '48b0a8c7-5808-4d3d-af89-f000d7e6e5df',
        'Intellect',
        2
    ),
    (
        '35017c2d-09a3-41c3-82ff-3a4c7b34e323',
        'Might',
        4
    ),
    (
        'df03c2cb-2695-4e44-8d9b-faa47bd3fe13',
        'Intellect',
        4
    ),
    (
        'dc18661d-9c7c-42e2-b8b0-e987b780817c',
        'Speed',
        4
    ),
    (
        'e6263109-ab19-4781-a0a0-06a2f6db99a2',
        'Might',
        4
    ),
    (
        'be273a99-dcf7-4430-a314-d82b7a20dc19',
        'Speed',
        4
    ),
    (
        'ed6790cb-da07-467d-8ca4-00ca3a5e10b1',
        'Intellect',
        2
    ),
    (
        'd788a73c-d9aa-4e01-b02e-a192e8f03a87',
        'Intellect',
        2
    ),
    (
        'e55726d5-9e52-4c31-a1cd-d4ed48769e97',
        'Might',
        2
    ),
    (
        'e55726d5-9e52-4c31-a1cd-d4ed48769e97',
        'Speed',
        2
    ),
    (
        '26e0bb4a-74e5-4a69-a641-83303da171ca',
        'Speed',
        2
    );

--

INSERT INTO
    character_descriptor_trainings (
        descriptor_id,
        skill_id,
        training_level
    )
VALUES
    -- Charming
    (
        '618e8216-6627-422a-8329-ba3ec4abb3eb',
        'c137b5da-694c-4a13-bf82-1cc53643b813',
        'Trained'
    ),

-- Clever
(
    'e4cdf650-fedc-4afb-9006-e12a40217cc1',
    '83488d7f-12f3-42d4-8306-9b10060cefc9',
    'Trained'
),

-- Graceful
(
    '13c28838-33d2-4899-b6e5-d7650c12a531',
    'da252ed8-61e4-4d7a-9e17-8cb7dc02ce99',
    'Trained'
),
(
    '13c28838-33d2-4899-b6e5-d7650c12a531',
    'eacf63f8-c5c0-4dd3-b636-a6369273087b',
    'Trained'
),
(
    '13c28838-33d2-4899-b6e5-d7650c12a531',
    '7368d90c-52d7-4117-b899-fd4124992825',
    'Trained'
),

-- Intelligent
(
    'e9ae81a7-66a4-40d5-9c22-888710b9f0e3',
    'c2c41c35-08c1-405e-a815-4ade46b5d814',
    'Trained'
),

-- Learned
(
    'b0b9e855-97dc-4786-a4b9-a0a3c6ab2149',
    'ed3fd46e-dc90-44e6-b744-08c4888e3bed',
    'Trained'
),
(
    'b0b9e855-97dc-4786-a4b9-a0a3c6ab2149',
    '410e28e8-aabb-46bb-9585-20d40eaa0c24',
    'Trained'
),

-- Mechanical
(
    'fe6eb862-2a8d-47f5-a7cd-335e80dbaed9',
    'fcb6a524-4e13-49f5-86fe-16fd9cef280b',
    'Trained'
),
(
    'fe6eb862-2a8d-47f5-a7cd-335e80dbaed9',
    '41d7882d-a5c5-4450-9753-50c845aab6d1',
    'Trained'
),

-- Mystical
(
    '48b0a8c7-5808-4d3d-af89-f000d7e6e5df',
    '9676df7f-7c53-4615-9fbd-8ba0b843822d',
    'Trained'
),
(
    '48b0a8c7-5808-4d3d-af89-f000d7e6e5df',
    'a1fadd3a-fda6-4fe0-bfd9-2b7955f1fe18',
    'Trained'
),

-- Strong
(
    '35017c2d-09a3-41c3-82ff-3a4c7b34e323',
    'b4c62b59-617b-4df9-b1ce-697150888451',
    'Trained'
),
(
    '35017c2d-09a3-41c3-82ff-3a4c7b34e323',
    'eacf63f8-c5c0-4dd3-b636-a6369273087b',
    'Trained'
),
(
    '35017c2d-09a3-41c3-82ff-3a4c7b34e323',
    '28bf7d87-d5d4-4484-a359-bc1f31eadc94',
    'Trained'
),

-- Strong-Willed
(
    'df03c2cb-2695-4e44-8d9b-faa47bd3fe13',
    '9085c582-43eb-4935-b340-dd40ac0c9fd6',
    'Trained'
),
(
    'df03c2cb-2695-4e44-8d9b-faa47bd3fe13',
    'bc35bef9-cc78-402a-8fc2-0b414f24ad38',
    'Trained'
),

-- Swift
(
    'dc18661d-9c7c-42e2-b8b0-e987b780817c',
    'eb0250ed-2676-49dc-bfab-e66ba5aa8859',
    'Trained'
),
(
    'dc18661d-9c7c-42e2-b8b0-e987b780817c',
    '41b3b54a-10e5-42e8-9e41-a866a7de8d1a',
    'Trained'
),

-- Tough
-- (No trained skills)

-- Stealthy
(
    'be273a99-dcf7-4430-a314-d82b7a20dc19',
    '39eb6faa-3b6f-419b-92bc-86b271c0770e',
    'Trained'
),
(
    'be273a99-dcf7-4430-a314-d82b7a20dc19',
    'c41506c8-75f5-4144-9c51-d00d9cb76b3d',
    'Trained'
),

-- Intuitive
(
    'ed6790cb-da07-467d-8ca4-00ca3a5e10b1',
    'dee36018-dbcd-44f6-92f1-6fb71350b9b9',
    'Trained'
),
(
    'ed6790cb-da07-467d-8ca4-00ca3a5e10b1',
    'd7417f40-e125-43bf-8d65-b1bc7e2fc8b3',
    'Trained'
),

-- Kind
(
    'd788a73c-d9aa-4e01-b02e-a192e8f03a87',
    'c137b5da-694c-4a13-bf82-1cc53643b813',
    'Trained'
),
(
    'd788a73c-d9aa-4e01-b02e-a192e8f03a87',
    '9f80c79d-4952-4216-a3b8-ab9a33f6fa6d',
    'Trained'
),

-- Vicious
(
    'e55726d5-9e52-4c31-a1cd-d4ed48769e97',
    '0ec7d921-00ab-475b-90ee-3dbc9907eb08',
    'Trained'
),

-- Cautious
(
    '26e0bb4a-74e5-4a69-a641-83303da171ca',
    'dee36018-dbcd-44f6-92f1-6fb71350b9b9',
    'Trained'
),
(
    '26e0bb4a-74e5-4a69-a641-83303da171ca',
    'fb21ac10-249e-4ea8-a754-ad7af482ec18',
    'Trained'
);

--

INSERT INTO
    character_descriptor_inabilities (descriptor_id, skill_id)
VALUES
    -- Charming
    (
        '618e8216-6627-422a-8329-ba3ec4abb3eb',
        '41b3b54a-10e5-42e8-9e41-a866a7de8d1a'
    ), -- Movement / Careful tasks

-- Clever
(
    'e4cdf650-fedc-4afb-9006-e12a40217cc1',
    'c2c41c35-08c1-405e-a815-4ade46b5d814'
), -- Knowledge-study tasks

-- Graceful
(
    '13c28838-33d2-4899-b6e5-d7650c12a531',
    'dee36018-dbcd-44f6-92f1-6fb71350b9b9'
), -- Perception/intuition tasks

-- Intelligent
(
    'e9ae81a7-66a4-40d5-9c22-888710b9f0e3',
    'dee36018-dbcd-44f6-92f1-6fb71350b9b9'
), -- Perception

-- Learned
(
    'b0b9e855-97dc-4786-a4b9-a0a3c6ab2149',
    'c137b5da-694c-4a13-bf82-1cc53643b813'
), -- Social interactions

-- Mechanical
(
    'fe6eb862-2a8d-47f5-a7cd-335e80dbaed9',
    'c137b5da-694c-4a13-bf82-1cc53643b813'
), -- Social interactions

-- Mystical
(
    '48b0a8c7-5808-4d3d-af89-f000d7e6e5df',
    'c137b5da-694c-4a13-bf82-1cc53643b813'
), -- Social interactions

-- Strong
(
    '35017c2d-09a3-41c3-82ff-3a4c7b34e323',
    'c2c41c35-08c1-405e-a815-4ade46b5d814'
), -- Knowledge tasks

-- Strong-Willed
(
    'df03c2cb-2695-4e44-8d9b-faa47bd3fe13',
    '41b3b54a-10e5-42e8-9e41-a866a7de8d1a'
), -- Movement / coordination

-- Swift
(
    'dc18661d-9c7c-42e2-b8b0-e987b780817c',
    '41b3b54a-10e5-42e8-9e41-a866a7de8d1a'
), -- Hasty actions

-- Tough
(
    'e6263109-ab19-4781-a0a0-06a2f6db99a2',
    'dee36018-dbcd-44f6-92f1-6fb71350b9b9'
), -- Perception

-- Stealthy
(
    'be273a99-dcf7-4430-a314-d82b7a20dc19',
    'c137b5da-694c-4a13-bf82-1cc53643b813'
), -- Social interactions

-- Intuitive
(
    'ed6790cb-da07-467d-8ca4-00ca3a5e10b1',
    'c2c41c35-08c1-405e-a815-4ade46b5d814'
), -- Knowledge / logic tasks

-- Kind
(
    'd788a73c-d9aa-4e01-b02e-a192e8f03a87',
    '0ec7d921-00ab-475b-90ee-3dbc9907eb08'
), -- Intimidation / combat

-- Vicious
(
    'e55726d5-9e52-4c31-a1cd-d4ed48769e97',
    'c137b5da-694c-4a13-bf82-1cc53643b813'
), -- Social interactions

-- Cautious
(
    '26e0bb4a-74e5-4a69-a641-83303da171ca',
    'eb0250ed-2676-49dc-bfab-e66ba5aa8859'
);
-- Initiative / hasty actions