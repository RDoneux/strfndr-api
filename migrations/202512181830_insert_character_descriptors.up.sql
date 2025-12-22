INSERT INTO
    character_descriptors (
        name,
        description,
        source_book,
        special_effect
    )
VALUES (
        'Charming',
        'You’re personable, charismatic, and socially adept. You’re good at getting people to like you, convincing them of your point of view, or smoothing over tense situations.',
        'Numenera Core Rulebook (2013)',
        'Once per day, reroll one failed persuasion or similar social roll.'
    ),
    (
        'Clever',
        'You’re inventive, resourceful, and quick-thinking. You come up with creative solutions and enjoy solving puzzles and problems.',
        'Numenera Core Rulebook (2013)',
        NULL
    ),
    (
        'Graceful',
        'You move with natural coordination and poise. You’re agile and quick, excelling at physical tasks that require balance or speed.',
        'Numenera Core Rulebook (2013)',
        NULL
    ),
    (
        'Intelligent',
        'You’re well-educated and logical, comfortable with complex reasoning and problem-solving. You analyze and plan before you act.',
        'Numenera Core Rulebook (2013)',
        NULL
    ),
    (
        'Learned',
        'You have extensive academic or practical knowledge, whether from study, teaching, or hands-on experience.',
        'Numenera Core Rulebook (2013)',
        'Choose two areas of knowledge to be trained in.'
    ),
    (
        'Mechanical',
        'You understand how machines, devices, and numenera function and fit together. You are curious about how things work and often take them apart.',
        'Numenera Core Rulebook (2013)',
        'You can attempt to repair or craft simple devices without tools (if materials are available).'
    ),
    (
        'Mystical',
        'You have a connection to unseen forces, mysterious energies, or the numenera itself. Others may see you as a sorcerer, priest, or psychic.',
        'Numenera Core Rulebook (2013)',
        'Trained in understanding esoteries and numenera.'
    ),
    (
        'Strong',
        'You rely on physical power and endurance. You are a natural athlete or laborer, capable of great feats of strength.',
        'Numenera Core Rulebook (2013)',
        NULL
    ),
    (
        'Strong-Willed',
        'Your mind is disciplined and resilient. You are hard to manipulate, intimidate, or frighten.',
        'Numenera Core Rulebook (2013)',
        NULL
    ),
    (
        'Swift',
        'You are faster than average, able to move, react, and strike before others.',
        'Numenera Core Rulebook (2013)',
        'You move 10% farther than normal when taking a move action.'
    ),
    (
        'Tough',
        'You’re physically durable and able to withstand hardship, fatigue, and pain.',
        'Numenera Core Rulebook (2013)',
        'Your first recovery roll each day is one step faster (1 action instead of 10 minutes).'
    ),
    (
        'Stealthy',
        'You are skilled at moving unseen and unheard. You know how to blend into crowds or vanish into shadows.',
        'Numenera Core Rulebook (2013)',
        NULL
    ),
    (
        'Intuitive',
        'You rely on gut feelings and insight rather than study or logic. You often sense what others miss.',
        'Numenera Core Rulebook (2013)',
        'Once per day, you can reroll a failed Intellect roll involving perception or insight.'
    ),
    (
        'Kind',
        'You’re compassionate, friendly, and generous. You prefer helping others and avoid violence when possible.',
        'Numenera Core Rulebook (2013)',
        NULL
    ),
    (
        'Vicious',
        'You are cruel and fierce, often intimidating or hurting others to get what you want. You can be ruthless when necessary.',
        'Numenera Core Rulebook (2013)',
        'You deal +1 damage in melee attacks.'
    ),
    (
        'Cautious',
        'You are careful, deliberate, and methodical. You avoid taking risks without preparation.',
        'Numenera Core Rulebook (2013)',
        'You can spend 1 extra round examining a situation to reduce its task difficulty by one step once per scene.'
    );

--

INSERT INTO
    character_descriptors_pool_modifiers (
        descriptor_id,
        pool_type,
        modifier_value
    )
VALUES (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Charming'
        ),
        'Intellect',
        2
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Clever'
        ),
        'Intellect',
        2
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Graceful'
        ),
        'Speed',
        2
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Intelligent'
        ),
        'Intellect',
        4
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Learned'
        ),
        'Intellect',
        2
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Mechanical'
        ),
        'Intellect',
        2
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Mystical'
        ),
        'Intellect',
        2
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Strong'
        ),
        'Might',
        4
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Strong-Willed'
        ),
        'Intellect',
        4
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Swift'
        ),
        'Speed',
        4
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Tough'
        ),
        'Might',
        4
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Stealthy'
        ),
        'Speed',
        4
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Intuitive'
        ),
        'Intellect',
        2
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Kind'
        ),
        'Intellect',
        2
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Vicious'
        ),
        'Might',
        2
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Vicious'
        ),
        'Speed',
        2
    ),
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Cautious'
        ),
        'Speed',
        2
    );

--

INSERT INTO
    character_descriptors_trainings (
        descriptor_id,
        skill_id,
        training_level
    )
VALUES
    -- Charming
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Charming'
        ),
        (
            SELECT id
            FROM skills
            WHERE
                name = 'Pleasant Social Interactions'
        ),
        'Trained'
    ),

-- Clever
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Clever'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Trickery'
    ),
    'Trained'
),

-- Graceful
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Graceful'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Balancing'
    ),
    'Trained'
),
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Graceful'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Jumping'
    ),
    'Trained'
),
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Graceful'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Dodging'
    ),
    'Trained'
),

-- Intelligent
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Intelligent'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Knowledge Tasks'
    ),
    'Trained'
),

-- Learned
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Learned'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Knowledge Area 1'
    ),
    'Trained'
),
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Learned'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Knowledge Area 2'
    ),
    'Trained'
),

-- Mechanical
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Mechanical'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Identifying Machines'
    ),
    'Trained'
),
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Mechanical'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Repairing Devices'
    ),
    'Trained'
),

-- Mystical
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Mystical'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Understanding Numenera'
    ),
    'Trained'
),
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Mystical'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Esoteries'
    ),
    'Trained'
),

-- Strong
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Strong'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Climbing'
    ),
    'Trained'
),
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Strong'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Jumping'
    ),
    'Trained'
),
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Strong'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Breaking Things'
    ),
    'Trained'
),

-- Strong-Willed
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Strong-Willed'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Resisting Mental Effects'
    ),
    'Trained'
),
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Strong-Willed'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Persuasion'
    ),
    'Trained'
),

-- Swift
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Swift'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Initiative'
    ),
    'Trained'
),
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Swift'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Movement Tasks'
    ),
    'Trained'
),

-- Tough
-- (No trained skills)

-- Stealthy
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Stealthy'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Sneaking'
    ),
    'Trained'
),
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Stealthy'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Hiding'
    ),
    'Trained'
),

-- Intuitive
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Intuitive'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Perception'
    ),
    'Trained'
),
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Intuitive'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Insight'
    ),
    'Trained'
),

-- Kind
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Kind'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Pleasant Social Interactions'
    ),
    'Trained'
),
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Kind'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Healing Others'
    ),
    'Trained'
),

-- Vicious
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Vicious'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Intimidation'
    ),
    'Trained'
),

-- Cautious
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Cautious'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Perception'
    ),
    'Trained'
),
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Cautious'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Intellect'
    ),
    'Trained'
);

--

INSERT INTO
    character_descriptors_inabilities (descriptor_id, skill_id)
VALUES
    -- Charming
    (
        (
            SELECT id
            FROM character_descriptors
            WHERE
                name = 'Charming'
        ),
        (
            SELECT id
            FROM skills
            WHERE
                name = 'Movement Tasks'
        )
    ), -- Movement / Careful tasks

-- Clever
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Clever'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Knowledge Tasks'
    )
), -- Knowledge-study tasks

-- Graceful
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Graceful'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Perception'
    )
), -- Perception/intuition tasks

-- Intelligent
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Intelligent'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Perception'
    )
), -- Perception

-- Learned
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Learned'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Pleasant Social Interactions'
    )
), -- Social interactions

-- Mechanical
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Mechanical'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Pleasant Social Interactions'
    )
), -- Social interactions

-- Mystical
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Mystical'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Pleasant Social Interactions'
    )
), -- Social interactions

-- Strong
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Strong'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Knowledge Tasks'
    )
), -- Knowledge tasks

-- Strong-Willed
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Strong-Willed'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Movement Tasks'
    )
), -- Movement / coordination

-- Swift
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Swift'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Movement Tasks'
    )
), -- Hasty actions

-- Tough
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Tough'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Perception'
    )
), -- Perception

-- Stealthy
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Stealthy'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Pleasant Social Interactions'
    )
), -- Social interactions

-- Intuitive
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Intuitive'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Knowledge Tasks'
    )
), -- Knowledge / logic tasks

-- Kind
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Kind'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Intimidation'
    )
), -- Intimidation / combat

-- Vicious
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Vicious'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Pleasant Social Interactions'
    )
), -- Social interactions

-- Cautious
(
    (
        SELECT id
        FROM character_descriptors
        WHERE
            name = 'Cautious'
    ),
    (
        SELECT id
        FROM skills
        WHERE
            name = 'Initiative'
    )
);
-- Initiative / hasty actions