-- Get all starting inabilities for a single character
SELECT DISTINCT
    skill_id,
    'Descriptor' AS source
FROM
    character_descriptors_inabilities cdi
    JOIN characters c ON cdi.descriptor_id = c.descriptor_id
WHERE
    c.id = 'ec5b72b2-4013-4676-88c7-bcf7f7d51a92'
UNION
SELECT DISTINCT
    skill_id,
    'Type' AS source
FROM
    character_types_inabilities cti
    JOIN characters c ON cti.type_id = c.type_id
WHERE
    c.id = 'ec5b72b2-4013-4676-88c7-bcf7f7d51a92'
UNION
SELECT DISTINCT
    skill_id,
    'Focus' AS source
FROM
    character_focus_inabilities cfi
    JOIN characters c ON cfi.focus_id = c.focus_id
WHERE
    c.id = 'ec5b72b2-4013-4676-88c7-bcf7f7d51a92';