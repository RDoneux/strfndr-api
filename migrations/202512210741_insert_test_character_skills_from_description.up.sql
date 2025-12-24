INSERT IGNORE INTO character_skills (character_id, skill_id, source)
SELECT DISTINCT * FROM (
    -- Descriptor skills
    SELECT 
        c.id AS character_id,
        s.id AS skill_id,
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
        s.id AS skill_id,
        'Type' AS source
    FROM characters c
    JOIN character_types ct ON c.type_id = ct.id
    JOIN character_types_trainings ctt ON ct.id = ctt.type_id
    JOIN skills s ON ctt.skill_id = s.id
    WHERE c.id = (SELECT id FROM characters WHERE name = 'Test Character')


    UNION

    -- Focus skills
    SELECT
        c.id AS character_id,
        s.id AS skill_id,
        'Focus' AS source
    FROM characters c
    JOIN character_focus cf ON c.focus_id = cf.id
    JOIN character_focus_trainings cft ON cf.id = cft.focus_id
    JOIN skills s ON cft.skill_id = s.id
    WHERE c.id = (SELECT id FROM characters WHERE name = 'Test Character')
) AS unified;
