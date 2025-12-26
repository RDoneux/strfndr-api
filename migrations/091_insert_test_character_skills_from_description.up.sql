INSERT IGNORE INTO character_skills (character_id, skill_id, training_level, source)
SELECT DISTINCT * FROM (
    -- Descriptor skills
    SELECT 
        c.id AS character_id,
        s.id as skill_id,
    	cdt.training_level as training_level,
        'Descriptor' AS source
    FROM characters c
    JOIN character_descriptors cd ON c.descriptor_id = cd.id
    JOIN character_descriptors_trainings cdt ON cd.id = cdt.descriptor_id
    JOIN skills s ON cdt.skill_id = s.id
    WHERE c.id = (SELECT id FROM characters WHERE name = 'Test Character')


    UNION

-- Type skills
SELECT
    c.id AS character_id,
    s.id as skill_id,
    ctt.training_level as training_level,
    'Type' AS source
FROM
    characters c
    JOIN character_types ct ON c.type_id = ct.id
    JOIN character_types_trainings ctt ON ct.id = ctt.type_id
    JOIN skills s ON ctt.skill_id = s.id
WHERE
    c.id = (
        SELECT id
        FROM characters
        WHERE
            name = 'Test Character'
    )
UNION

-- Focus skills
SELECT
    character_id,
    skill_id,
    training_level,
    'Focus' AS source
FROM (
    SELECT
        c.id AS character_id,
        s.id AS skill_id,
        cft.training_level AS training_level,
        cftc.tier AS tier,
        ROW_NUMBER() OVER (
            PARTITION BY s.name, c.name
            ORDER BY cftc.tier DESC
        ) AS rn
    FROM characters c
    JOIN character_focus cf ON c.focus_id = cf.id
    JOIN character_focus_trainings cft ON cf.id = cft.focus_id
    JOIN character_focus_tier_classifications cftc
        ON cft.classification_id = cftc.id
        AND cftc.tier <= c.tier
    JOIN skills s ON cft.skill_id = s.id
    WHERE c.id = (SELECT id FROM characters WHERE name = 'Test Character')
) ranked
WHERE rn = 1
) AS unified;