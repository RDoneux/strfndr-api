DELETE FROM character_focus_tier_classifications
WHERE
    focus_id = (
        SELECT id
        FROM character_focus
        WHERE
            name = 'Bears a Halo of Fire'
    );