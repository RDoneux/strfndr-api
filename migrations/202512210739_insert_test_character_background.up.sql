INSERT INTO
    character_backgrounds (character_id, background)
VALUES (
        (
            SELECT id
            FROM characters
            WHERE
                name = 'Test Character'
        ),
        'A wanderer drifts between ruins and settlements, a half-seen figure whose outline sometimes blurs at the edges. They move with uncanny grace, slipping through danger as if the world itself cannot decide whether to hold or release them. The numenera fascinate them—not for power, but for the strange echoes of forgotten worlds they sense when touching ancient metal. People whisper that they don’t fully exist in this reality, yet they always arrive where they’re most needed, silent, swift, and gone before anyone can thank them.'
    )