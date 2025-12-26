DELETE FROM character_special_abilities
WHERE character_id = (SELECT id FROM characters WHERE name = 'Test Character');