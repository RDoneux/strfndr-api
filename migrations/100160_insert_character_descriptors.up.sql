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
    ),
    (
        'Learned',
        'You have studied, either on your own or with an instructor. You know many things and are an expert on a few topics, such as history, biology geography, the numenera, nature, or any other area of study. Learned characters typically carry a few books around with them and spend their spare time reading.',
        'Core Rulebook 2013'
    ),
    (
        'Mystical/Mechanical',
        'You have a special talent that can be viewed in two ways. You might think of yourself as "mystical" and thus attuned with the mysterious and the paranormal, or you might think of yourself as "mechanical", and thus adept with devices and machines. In either case, your true talents lie with the numenera. You likely have experience with ancient lore, and you can sense and wield the numenera - though whether that means "magic" or "technology" is up to you (and probably up to those around you as well). Mystical characters often wear jewelry, such as a ring or an amulet, or have tattoos or other marks that show their interests. Mechanical charactes tend to carry a lot of tools and treat them almost like talismans.',
        'Core Rulebook 2013'
    ),
    (
        'Rugged',
        'You''re a nature lover accustomed to living rough, pitting your iwts against the elements. Most likely, you''re a skilled hunter, gatherer, or naturalist. Years of living in the wild have left their mark with a worn countenance, wild hair, or scars. Your clothing is probably much less refined than the garments worn by city dwellers.',
        'Core Rulebook 2013'
    ),
    (
        'Stealthy',
        'You''re sneaky, slippery, and fast. These talents help you hid, move quietly, and pull of tricks that require sleight of hand. Most likely, you''re wiry and small. However you''re not much of a sprinter - you''re more dexterous than fleet of foot.',
        'Core Rulebook 2013'
    ),
    (
        'Strong',
        'You''re extremely strong and physically powerful, and you use these qualities well, whether through violence or feats of prowess. You likely have a brwany build and impressive muscles.',
        'Core Rulebook 2013'
    ),
    (
        'Strong Willed',
        'You''re touch-minded, willful, and independent. No one can talk you into anything or change your mind when you don''t want it changed. This quality doesn''t necessarily make you smart, but it does make you a bastion of willpower and resolve. You likely dress and act with unique style and flair, not caring what others think.',
        'Core Rulebook 2013'
    ),
    (
        'Swift',
        'You move quickly, able to sprint in short bursts and work with your hands with dexterity. You''re great at crossing distances quickly but not always smooothly. You are likely slim and muscular.',
        'Core Rulebook 2013'
    ),
    (
        'Tough',
        'You''re strong and can take a lot of physical punishment. You might have a large frame and a square jaw. Tough characters frequently have visible scars.',
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
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Learned'),
        'INTELLECT',
        2,
        0
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Mystical/Mechanical'),
        'INTELLECT',
        2,
        0
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Stealthy'),
        'SPEED',
        2,
        0
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Strong'),
        'MIGHT',
        4,
        0
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Strong Willed'),
        'INTELLECT',
        4,
        0
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Swift'),
        'SPEED',
        4,
        0
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Tough'),
        'ARMOUR',
        1,
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
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Learned'),
        (SELECT id FROM skills WHERE name = 'Knowledge'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Mystical/Mechanical'),
        (SELECT id FROM skills WHERE name = 'Understanding Numenera'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Mystical/Mechanical'),
        (SELECT id FROM skills WHERE name = 'Sense Magic'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Mystical/Mechanical'),
        (SELECT id FROM skills WHERE name = 'Hedge Magic'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Rugged'),
        (SELECT id FROM skills WHERE name = 'Physical Skills'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Rugged'),
        (SELECT id FROM skills WHERE name = 'Animal Handling'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Rugged'),
        (SELECT id FROM skills WHERE name = 'Botany'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Stealthy'),
        (SELECT id FROM skills WHERE name = 'Stealth'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Stealthy'),
        (SELECT id FROM skills WHERE name = 'Thievery'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Stealthy'),
        (SELECT id FROM skills WHERE name = 'Illusions and Trickery'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Strong'),
        (SELECT id FROM skills WHERE name = 'Breaking Things'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Strong'),
        (SELECT id FROM skills WHERE name = 'Jumping'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Strong Willed'),
        (SELECT id FROM skills WHERE name = 'Mental Resistance'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Strong Willed'),
        (SELECT id FROM skills WHERE name = 'Focus'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Swift'),
        (SELECT id FROM skills WHERE name = 'Initiative'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Swift'),
        (SELECT id FROM skills WHERE name = 'Running'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Tough'),
        (SELECT id FROM skills WHERE name = 'Health'),
        'TRAINED'
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Tough'),
        (SELECT id FROM skills WHERE name = 'Might Defence'),
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
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Mystical/Mechanical'),
        (SELECT id FROM inabilities WHERE name = 'Social Interaction')
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Rugged'),
        (SELECT id FROM inabilities WHERE name = 'Social Interaction')
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Stealthy'),
        (SELECT id FROM inabilities WHERE name = 'Movement Tasks')
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Strong Willed'),
        (SELECT id FROM inabilities WHERE name = 'Retaining Facts')
    ),
    (
        (SELECT id FROM character_descriptors WHERE name = 'Swift'),
        (SELECT id FROM inabilities WHERE name = 'Gracefulness')
    );

INSERT INTO character_descriptor_items (
    descriptor_id,
    item_id
) VALUES
    (
        (SELECT id FROM character_descriptors WHERE name = 'Rugged'),
        (SELECT id FROM items WHERE name = 'Explorer''s pack')
    );