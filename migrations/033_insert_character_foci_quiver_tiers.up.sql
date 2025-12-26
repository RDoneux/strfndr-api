INSERT INTO
    character_focus_tier_classifications (
        focus_id,
        tier,
        description,
        classification
    )   
VALUES
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        1,
        'To be truly deadly with a bow, you must know where to aim. You can spend points from either your Speed Pool or your Intellect Pool to apply levels of Effort to increase your bow damage. Each level of Effort adds 3 points of damage to a successful attack.',
        'Archer'
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        2,
        'In a round where you attack with a bow, if you fire an additional arrow, the difficulty of attacks and spacial abilities used by the target is increased by one step',
        'Covering Fire'
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        3,
        'You are trained in using bows',
        'Trained Archer'
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        4,
        'If you roll a natural 17 or higher with a bow attack, instead of adding damage or a minor or major effect, you can make another attack with your bow. This attack reuses the same Effort and bonuses (if any) from the first attack',
        'Quick Shot'
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        5,
        'You are specialised in using bows',
        'Phenomenal Archer'
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        6,
        'You inflict 3 additional points of damage with a bow. The Might points spent to use this ability are in addition to any Speed points spent on the attack',
        'Powerful Shot (2 Might points)'
    );

INSERT INTO character_focus_trainings (
    focus_id,
    classification_id,
    skill_id,
    training_level
)
VALUES
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM character_focus_tier_classifications WHERE classification = 'Archer'),
        (SELECT id FROM skills WHERE name = 'Fletcher'),
        'Trained'
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM character_focus_tier_classifications WHERE classification = 'Covering Fire'),
        (SELECT id FROM skills WHERE name = 'Bowyer'),
        'Trained'
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM character_focus_tier_classifications WHERE classification = 'Trained Archer'),
        (SELECT id FROM skills WHERE name = 'Fletcher'),
        'Specialised'
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM character_focus_tier_classifications WHERE classification = 'Quick Shot'),
        (SELECT id FROM skills WHERE name = 'Bowyer'),
        'Specialised'
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM character_focus_tier_classifications WHERE classification = 'Phenomenal Archer'),
        (SELECT id FROM skills WHERE name = 'Using Bows'),
        'Specialised'
    );
