INSERT INTO
	character_special_abilities (character_id, special_ability_id) (
SELECT
	c.id AS character_id,
	sa.id AS special_ability_id
FROM
	characters c,
	special_abilities sa
WHERE
	c.name = 'Test Character'
	AND sa.type = (
		SELECT
			ct.name
		FROM
			characters c
			JOIN character_types ct ON ct.id = c.type_id
		WHERE
			c.name = 'Test Character'
	)
	AND sa.tier <= c.tier
);