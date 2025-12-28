INSERT INTO
    character_focus_tier_classifications (
        focus_id,
        special_ability_id
    )  
VALUES
    (
        (SELECT id FROM character_focus WHERE name = 'Commands Mental Powers'),
        (SELECT id FROM special_abilities WHERE type = 'Commands Mental Powers' AND tier = 1)
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Commands Mental Powers'),
        (SELECT id FROM special_abilities WHERE type = 'Commands Mental Powers' AND tier = 2)
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Commands Mental Powers'),
        (SELECT id FROM special_abilities WHERE type = 'Commands Mental Powers' AND tier = 3)
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Commands Mental Powers'),
        (SELECT id FROM special_abilities WHERE type = 'Commands Mental Powers' AND tier = 4)
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Commands Mental Powers'),
        (SELECT id FROM special_abilities WHERE type = 'Commands Mental Powers' AND tier = 5)
    ),
    (
        (SELECT id FROM character_focus WHERE name = 'Commands Mental Powers'),
        (SELECT id FROM special_abilities WHERE type = 'Commands Mental Powers' AND tier = 6)
    );