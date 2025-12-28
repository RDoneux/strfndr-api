INSERT INTO
    character_focus_tier_classifications (focus_id, special_ability_id)
VALUES (
        (
            SELECT id
            FROM character_focus
            WHERE
                name = 'Bears a Halo of Fire'
        ),
        (
            SELECT id
            FROM special_abilities
            WHERE
                type = 'Bears a Halo of Fire'
                AND tier = 1
        )
    ),
    (
        (
            SELECT id
            FROM character_focus
            WHERE
                name = 'Bears a Halo of Fire'
        ),
        (
            SELECT id
            FROM special_abilities
            WHERE
                type = 'Bears a Halo of Fire'
                AND tier = 2
        )
    ),
    (
        (
            SELECT id
            FROM character_focus
            WHERE
                name = 'Bears a Halo of Fire'
        ),
        (
            SELECT id
            FROM special_abilities
            WHERE
                type = 'Bears a Halo of Fire'
                AND tier = 3
        )
    ),
    (
        (
            SELECT id
            FROM character_focus
            WHERE
                name = 'Bears a Halo of Fire'
        ),
        (
            SELECT id
            FROM special_abilities
            WHERE
                type = 'Bears a Halo of Fire'
                AND tier = 4
        )
    ),
    (
        (
            SELECT id
            FROM character_focus
            WHERE
                name = 'Bears a Halo of Fire'
        ),
        (
            SELECT id
            FROM special_abilities
            WHERE
                type = 'Bears a Halo of Fire'
                AND tier = 5
        )
    ),
    (
        (
            SELECT id
            FROM character_focus
            WHERE
                name = 'Bears a Halo of Fire'
        ),
        (
            SELECT id
            FROM special_abilities
            WHERE
                type = 'Bears a Halo of Fire'
                AND tier = 6
        )
    );