INSERT INTO character_pools (
    character_id,
    might_current, might_max, might_edge,
    speed_current, speed_max, speed_edge,
    intellect_current, intellect_max, intellect_edge
)
SELECT
    c.id AS character_id,

    -- Might
    COALESCE(SUM(CASE WHEN pm.pool_type = 'Might' THEN pm.modifier_value END), 0) AS might_current,
    COALESCE(SUM(CASE WHEN pm.pool_type = 'Might' THEN pm.modifier_value END), 0) AS might_max,
    COALESCE(MAX(tp.edge_value), 0) AS might_edge,

    -- Speed
    COALESCE(SUM(CASE WHEN pm.pool_type = 'Speed' THEN pm.modifier_value END), 0) AS speed_current,
    COALESCE(SUM(CASE WHEN pm.pool_type = 'Speed' THEN pm.modifier_value END), 0) AS speed_max,
    COALESCE(MAX(sp.edge_value), 0) AS speed_edge,

    -- Intellect
    COALESCE(SUM(CASE WHEN pm.pool_type = 'Intellect' THEN pm.modifier_value END), 0) AS intellect_current,
    COALESCE(SUM(CASE WHEN pm.pool_type = 'Intellect' THEN pm.modifier_value END), 0) AS intellect_max,
    COALESCE(MAX(ip.edge_value), 0) AS intellect_edge

FROM characters c

LEFT JOIN (
    SELECT descriptor_id AS source_id, pool_type, modifier_value FROM character_descriptors_pool_modifiers
    UNION ALL
    SELECT type_id AS source_id, pool_type, modifier_value FROM character_types_pool_modifiers
    UNION ALL
    SELECT focus_id AS source_id, pool_type, modifier_value FROM character_focus_pool_modifiers
) AS pm ON pm.source_id IN (c.descriptor_id, c.type_id, c.focus_id)

-- Edge comes from type pool modifiers only
LEFT JOIN character_types_pool_modifiers tp ON tp.type_id = c.type_id AND tp.pool_type = 'Might'
LEFT JOIN character_types_pool_modifiers sp ON sp.type_id = c.type_id AND sp.pool_type = 'Speed'
LEFT JOIN character_types_pool_modifiers ip ON ip.type_id = c.type_id AND ip.pool_type = 'Intellect'

WHERE c.id = (SELECT id FROM characters WHERE name = 'Test Character')
GROUP BY c.id;
