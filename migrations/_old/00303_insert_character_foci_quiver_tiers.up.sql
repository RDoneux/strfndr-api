INSERT INTO
    character_focus_tier_classifications (
        focus_id,
        special_ability_id
    )   
VALUES
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM special_abilities WHERE type = 'Carries a Quiver' AND tier = 1)
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM special_abilities WHERE type = 'Carries a Quiver' AND tier = 2)
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM special_abilities WHERE type = 'Carries a Quiver' AND tier = 3)
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM special_abilities WHERE type = 'Carries a Quiver' AND tier = 4)
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM special_abilities WHERE type = 'Carries a Quiver' AND tier = 5)
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM special_abilities WHERE type = 'Carries a Quiver' AND tier = 6)
    );

INSERT INTO character_focus_trainings (
    focus_id,
    special_ability_id,
    skill_id,
    training_level
)
VALUES
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM special_abilities WHERE name = 'Archer'),
        (SELECT id FROM skills WHERE name = 'Fletcher'),
        'Trained'
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM special_abilities WHERE name = 'Covering Fire'),
        (SELECT id FROM skills WHERE name = 'Bowyer'),
        'Trained'
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM special_abilities WHERE name = 'Trained Archer'),
        (SELECT id FROM skills WHERE name = 'Fletcher'),
        'Specialised'
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM special_abilities WHERE name = 'Quick Shot'),
        (SELECT id FROM skills WHERE name = 'Bowyer'),
        'Specialised'
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Carries a Quiver'),
        (SELECT id FROM special_abilities WHERE name = 'Phenomenal Archer'),
        (SELECT id FROM skills WHERE name = 'Using Bows'),
        'Specialised'
    );
