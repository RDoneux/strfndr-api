INSERT INTO character_descriptors (
    name,
    description,
    source_book
) VALUES
    (
        'Charming',
        'You''re a smooth talker and a charmer. Whether through seemingly supernatural means or just a way with words, you can convince others to do as you wish. Most likely, you''re physically attractive or at least highly charismatic, and other senjoy listening to your voice. You probably pay attention to your appearance, keeping yourself well groomed. You make friends easily. You play up the personality facet of your intellect stat; intelligence is not your strong suit. YOu''re personable, not necessarily studious or strong-willed.',
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
    );

INSERT INTO character_descriptor_inabilities (
    descriptor_id,
    skill_id
) VALUES
    (
        (SELECT id FROM character_descriptors WHERE name = 'Charming'),
        (SELECT id FROM skills WHERE name = 'Knowledge (Lore)')
    );