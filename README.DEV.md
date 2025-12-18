### SQL

#### Select character information and skills

```sql
SELECT
    ch.id as character_id,
    ch.character_name,
    ch.player_name,
    ch.experience,
    ch.level,
    cl.name AS class,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'skillName', cs.skill_name,
            'modifyingAttribute', cs.modifying_attribute,
            'attributeScore', CASE cs.modifying_attribute
                WHEN 'Strength' THEN ch.strength
                WHEN 'Dexterity' THEN ch.dexterity
                WHEN 'Constitution' THEN ch.constitution
                WHEN 'Intelligence' THEN ch.intelligence
                WHEN 'Wisdom' THEN ch.wisdom
                WHEN 'Charisma' THEN ch.charisma
                ELSE NULL
            END,
            'proficiencyLevel', sp.level,
            'proficiencyModifier', sp.modifier
        )
    ) AS skills
FROM
    `characters` ch
    LEFT JOIN classes cl ON ch.class_id = cl.id
    LEFT JOIN character_skills cs ON ch.id = cs.character_id
    LEFT JOIN skill_proficiencies sp ON cs.proficiency_level_id = sp.id
GROUP BY ch.id, ch.character_name, ch.player_name, ch.experience, ch.level, cl.name;
```

#### Select Saving Throw Character Information

```sql
SELECT
	c.character_name,
	c.player_name,
	st.saving_throw_name,
	st.modifying_attribute,
	sp.level,
	sp.modifier AS proficiency_modifier,
	CASE st.modifying_attribute
		WHEN 'Constitution' THEN c.constitution
		WHEN 'Dexterity' THEN c.dexterity
		WHEN 'Wisdom' THEN c.wisdom
		ELSE NULL
	END AS attribute_modifier
FROM
	saving_throws st
	LEFT JOIN skill_proficiencies sp ON sp.id = st.proficiency_level_id
	LEFT JOIN characters c ON c.id = st.character_id
WHERE character_id = 'a1b2c3d4-e5f6-7890-abcd-ef0123456789';
```

### Select Character Skills Information

```sql
SELECT
	cs.skill_name,
	sp.level,
	sp.modifier,
	cs.modifying_attribute,
	cs.skill_rank,
		CASE cs.modifying_attribute
		WHEN 'Constitution' THEN c.constitution
		WHEN 'Dexterity' THEN c.dexterity
		WHEN 'Wisdom' THEN c.wisdom
		WHEN 'Strength' THEN c.strength
		WHEN 'Intelligence' THEN c.intelligence
		WHEN 'Charisma' THEN c.charisma
		ELSE NULL
	END AS attribute_modifier
FROM
	character_skills cs
	LEFT JOIN skill_proficiencies sp ON cs.proficiency_level_id = sp.id
	LEFT JOIN characters c ON c.id = cs.character_id
WHERE
	cs.character_id = 'a1b2c3d4-e5f6-7890-abcd-ef0123456789';
```

### Select Character Weapons

```sql
SELECT
	c.character_name,
	rw.name,
	rw.damage
FROM
	ranged_weapons rw
	LEFT JOIN characters c ON rw.character_id = c.id
WHERE c.id = 'a1b2c3d4-e5f6-7890-abcd-ef0123456789';
```
