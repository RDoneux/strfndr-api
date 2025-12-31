INSERT INTO character_descriptors (
    name,
    description,
    source_book
) VALUES
    (
        'Charming',
        'You''re a smooth talker and a charmer. Whether through seemingly supernatural means or just a way with words, you can convince others to do as you wish. Most likely, you''re physically attractive or at least highly charismatic, and other senjoy listening to your voice. You probably pay attention to your appearance, keeping yourself well groomed. You make friends easily. You play up the personality facet of your intellect stat; intelligence is not your strong suit. YOu''re personable, not necessarily studious or strong-willed.',
        'Core Rulebook 2013'
    ),
    (
        'Clever',
        'You''re quick-witted, thinking well on your feet. You undestand people, so you can fool them but are rarely fooled. Because you easily see things for what they are, you get the lay of the land sqiftly, size up threats and allies and assess situations with accuracy. Perhaps you''re physically attractive, or maybe you use your wit to overcome any physical or mental imperfections.',
        'Core Rulebook 2013'
    ),
    (
        'Graceful',
        'You have a perfect sense of balance, moving and speaking with grace and beauty. You''re quick, lithe, flexible, and dexterous. Your body is perfectly suited to dance, and you use that advantage in combat to dodge blows. You might wear garments that enhance your agile movement and sense of style.',
        'Core Rulebook 2013'
    ),
    (
        'Intelligent',
        'You''re quite smart. Your memory is sharp, and you easily grasp concepts that others might struggle with. This aptitude does''t necessarily mean that you''ve had years of formal education, but you have learned a great deal in your life, primarily because you pick things up quickly and retrain so much.',
        'Core Rulebook 2013'
    );

INSERT INTO character_descriptor_pool_modifiers (
    descriptor_id,
    pool_type,
    modifier_value,
    edge_value
) VALUES
    (
        (SELECT id FROM character_descriptors WHERE name = 'Charming'),
        'INTELLECT',
        2,
        0
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Charming'),
        'SHINS',
        10,
        0
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Clever'),
        'INTELLECT',
        2,
        0
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Clever'),
        'SHINS',
        10,
        0
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Graceful'),
        'SPEED',
        2,
        0
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Intelligent'),
        'INTELLECT',
        2,
        0
    );

INSERT INTO character_descriptor_skills (
    descriptor_id,
    skill_id,
    training_level
) VALUES
    (
        (SELECT id FROM character_descriptors WHERE name = 'Charming'),
        (SELECT id FROM skills WHERE name = 'Social Interaction'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Clever'),
        (SELECT id FROM skills WHERE name = 'Trickery'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Clever'),
        (SELECT id FROM skills WHERE name = 'Assessment'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Clever'),
        (SELECT id FROM skills WHERE name = 'Resist Mental Effects'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Graceful'),
        (SELECT id FROM skills WHERE name = 'Balance'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Graceful'),
        (SELECT id FROM skills WHERE name = 'Performance'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Graceful'),
        (SELECT id FROM skills WHERE name = 'Evasion'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Intelligent'),
        (SELECT id FROM skills WHERE name = 'Memory'),
        'TRAINED'
    );

INSERT INTO character_descriptor_inabilities (
    descriptor_id,
    inability_id
) VALUES
    (
        (SELECT id FROM character_descriptors WHERE name = 'Charming'),
        (SELECT id FROM inabilities WHERE name = 'Willpower')
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Charming'),
        (SELECT id FROM inabilities WHERE name = 'Retaining Facts')
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Clever'),
        (SELECT id FROM inabilities WHERE name = 'Retaining Facts')
    );