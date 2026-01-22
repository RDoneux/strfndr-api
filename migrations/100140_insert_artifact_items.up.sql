INSERT INTO
    items (name, description, item_type)
VALUES (
        'Amber Casement',
        'A series of short, rounded tubes and hoses about 30cm long',
        'ARTIFACT'
    ),
    (
        'Living Armour Sheath',
        'When not affixed to a creature, this looks like a mass of heavy fabric. On a creature, it looks like heavy, leathery flesh.',
        'ARTIFACT'
    );

INSERT INTO
    artifacts (
        item_id,
        level_descriptor,
        depletion,
        effect
    )
VALUES (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Amber Casement'
        ),
        '1d6 + 4',
        '1-4 in 1d6',
        'When activated, it solidifies the air in a 3 meter cube of space, the center of which must be within short range of the device. The air is turned into an amberlike substance, and those trapped in ti will likely soffocate or starve'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Living Armour Sheath'
        ),
        '1d6 + 1',
        '1 in 1d100 (checked everyday whilst the sheath is worn)',
        'When worn over normal skin, this organic material adheres and conforms to the creature''s body shape. The wearer is trained in Might defense tasks to resist poison and disease. Further, she has +2 to Armour with no hindrances. However, they cannot wear armour over the living sheath because it''s too bulky.'
    );

INSERT INTO
    artifacts_pool_modifiers (
        artifact_id,
        pool_type,
        modifier_value,
        edge_value
    )
VALUES (
        (
            SELECT item_id
            FROM artifacts
            WHERE
                item_id = (
                    SELECT id
                    FROM items
                    WHERE
                        name = 'Living Armour Sheath'
                )
        ),
        'ARMOUR',
        2,
        0
    );

INSERT INTO
    item_equip_locations (item_id, equip_location)
VALUES (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Amber Casement'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Living Armour Sheath'
        ),
        'TORSO'
    );