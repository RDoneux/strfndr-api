INSERT INTO skills (
    name,
    category,
    description,
    attack_modifier,
    cost,
    type
) VALUES
(
    'Skill Slot',
    'CUSTOM',
    'This is a generic skill slot that can be customized by the player.',
    0,
    NULL,
    'SKILL_SLOT'
),
(
    'Fighting Move Choice Slot',
    'CUSTOM',
    'This is a generic fighting move slot that can be customized by the player.',
    0,
    NULL,
    'FIGHTING_MOVE_CHOICE_SLOT'
),
(
    'Esotery Choice Slot',
    'CUSTOM',
    'This is a generic esotery slot that can be customized by the player.',
    0,
    NULL,
    'ESOTERY_CHOICE_SLOT'
),
(
    'Astronomy',
    'INTELLECT',
    'The skill of studying stars, planets, and other celestial phenomena. Used for navigation and understanding cosmic events.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Social Interaction',
    'INTELLECT',
    'You''re particularly good at any task involving positive or pleasant social interactions',
    0,
    NULL,
    'PASSIVE'
),
(
    'Resist Mental Effects',
    'INTELLECT',
    'Your mind is strong against mental attacks and manipulations.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Trickery',
    'INTELLECT',
    'You excel at deceiving, misleading, or confusing others.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Assessment',
    'INTELLECT',
    'You have a keen eye for reading people and situations, allowing you to quickly identify or assess danger, lies, quality, importance, functions or power.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Mental Influence',
    'INTELLECT',
    'You have a talent for using esoteries or special abilities that influence the minds of others.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Balance',
    'SPEED',
    'You have exceptional equilibrium and coordination, allowing you to maintain your balance in precarious situations.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Performance',
    'SPEED',
    'You are skilled at entertaining others through various forms of performance, such as music, dance, or acting.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Evasion',
    'SPEED',
    'You are adept at all speed defence skills.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Memory',
    'INTELLECT',
    'You have an exceptional memory, allowing you to recall information, events, or details with ease.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Knowledge',
    'INTELLECT',
    'You have a broad base of knowledge in various subjects, allowing you to recall facts and information quickly.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Understanding Numenera',
    'INTELLECT',
    'You are particularly skills at all actions which involve identifying or understanding numenera.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Sense Magic',
    'INTELLECT',
    'You can sense whether the numenera is active in situations where its presence is not obvious. You must study an object or location closely for a minute to get a feel for whether the touch of the ancients is at work.',
    0,
    NULL,
    'ACTION'
),
(
    'Hedge Magic',
    'INTELLECT',
    'You can perform simple tricks: temporarily change the colour or basic appearance of a small object, cause small objects to float through the air, clean a small area, mend a broken object, prepare (but not create) food, and so on. You can''t use hedge magic to harm another creature of object.',
    0,
    '1 Intellect Point',
    'ESOTERY'
),
(
    'Physical Skills',
    'MIGHT',
    'You are particularly skilled at all actions which involve physical prowess, such as climbing, jumping, or swimming.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Animal Handling',
    'MIGHT',
    'You''re skilled in all tasks involving training, riding, or placating natural animals.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Botany',
    'INTELLECT',
    'You have extensive knowledge of plants, fungi, and other flora, including their uses, habitats, and characteristics.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Stealth',
    'SPEED',
    'You''re skilled in all stealthy tasks.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Thievery',
    'SPEED',
    'You are skilled in all interactions involving lies or trickery.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Illusions and Trickery',
    'SPEED',
    'You are skilled in all esoteries or speical abilities involving illusions or trickery.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Breaking Things',
    'MIGHT',
    'You are skilled in all actions involving breaking inanimate objects.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Jumping',
    'SPEED',
    'You are skilled in all jumping-related tasks.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Mental Resistance',
    'INTELLECT',
    'You are skilled in resisting mental effects',
    0,
    NULL,
    'PASSIVE'
),
(
    'Focus',
    'INTELLECT',
    'You are skilled in tasks requiring incredible focus or concentration.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Initiative',
    'SPEED',
    'You are skilled in initiative actions (to determine who goes first in combat).',
    0, 
    NULL,
    'PASSIVE'
),
(
    'Running',
    'SPEED',
    'You are skilled in all running-related tasks.',
    0, 
    NULL,
    'PASSIVE'
),
(
    'Health',
    'MIGHT',
    'Add 1 to the points you regain when you make a recovery roll.',
    0, 
    NULL,
    'PASSIVE'
),
(
    'Might Defence',
    'MIGHT',
    'You''re skilled at all might defence skills.',
    0,
    NULL,
    'PASSIVE'
),
(
    'Bash',
    'MIGHT',
    'This is a pummeling melee attack. Your attack inflicts 1 less point of damage than normal, but dazes your target for one round, during which time the difficulty of all tasks it performs is modified by one step to its detriment.',
    -1,
    1,
    'FIGHTING_MOVE'
),
(
    'No Need for Weapons',
    'CUSTOM',
    'When you make an unarmed attack (such as a punch or kick), it counts as a medium weapon instead of a light weapon.',
    0,
    NULL,
    'FIGHTING_MOVE'
),
(
    'Pierce',
    'SPEED',
    'This is a well-aimed, penetrating ranged attack. You make an attack and inflict 1 additional point of damage if your weapon has a sharp point',
    1,
    1,
    'FIGHTING_MOVE'
),
(
    'Thrust',
    'MIGHT',
    'This is a powerful melee stab. You make an attack and inflict 1 additional point of damage if your weapon has a sharp edge or point.',
    1,
    1,
    'FIGHTING_MOVE'
),
(
    'Trained Without Armour',
    'CUSTOM',
    'You are trained in Speed defense actions when not wearing armour.',
    0,
    NULL,
    'FIGHTING_MOVE'
),
(
    'No Need for Weapons',
    'SPECIAL_ABILITY',
    'When you make an unarmed attack (such as a punch or kick), it counts as a medium weapon instead of a light weapon.',
    0,
    NULL,
    'ENABLER'
),
(
    'Cypher Use',
    'SPECIAL_ABILITY',
    'You can bear two cyphers at a time.',
    0,
    NULL,
    'ENABLER'
),
(
    'Practiced in Armour',
    'SPECIAL_ABILITY',
    'You can wear armour for long period of time without tiring and can compensate for slowed reactions from wearing armour. You can wear any kind of armour. You reduce the Might cost per hour for wearing armour and the Speed Pool reduction for wearing armour by 2.',
    0,
    NULL,
    'ENABLER'
),
(
    'Practiced With All Weapons',
    'SPECIAL_ABILITY',
    'You can use any weapon',
    0,
    NULL,
    'ENABLER'
);