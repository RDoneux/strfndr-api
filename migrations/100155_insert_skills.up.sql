INSERT INTO skills (
    name,
    category,
    description,
    attack_modifier,
    armour_modifier,
    cost,
    type
) VALUES
(
    'Skill Slot',
    'CUSTOM',
    'This is a generic skill slot that can be customized by the player.',
    0,
    0,
    0,
    'SKILL_SLOT'
),
(
    'Fighting Move Choice Slot',
    'CUSTOM',
    'This is a generic fighting move slot that can be customized by the player.',
    0,
    0,
    0,
    'FIGHTING_MOVE_CHOICE_SLOT'
),
(
    'Esotery Choice Slot',
    'CUSTOM',
    'This is a generic esotery slot that can be customized by the player.',
    0,
    0,
    0,
    'ESOTERY_CHOICE_SLOT'
),
(
    'Astronomy',
    'INTELLECT',
    'The skill of studying stars, planets, and other celestial phenomena. Used for navigation and understanding cosmic events.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Social Interaction',
    'INTELLECT',
    'You''re particularly good at any task involving positive or pleasant social interactions',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Resist Mental Effects',
    'INTELLECT',
    'Your mind is strong against mental attacks and manipulations.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Trickery',
    'INTELLECT',
    'You excel at deceiving, misleading, or confusing others.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Assessment',
    'INTELLECT',
    'You have a keen eye for reading people and situations, allowing you to quickly identify or assess danger, lies, quality, importance, functions or power.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Mental Influence',
    'INTELLECT',
    'You have a talent for using esoteries or special abilities that influence the minds of others.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Balance',
    'SPEED',
    'You have exceptional equilibrium and coordination, allowing you to maintain your balance in precarious situations.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Performance',
    'SPEED',
    'You are skilled at entertaining others through various forms of performance, such as music, dance, or acting.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Evasion',
    'SPEED',
    'You are adept at all speed defence skills.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Memory',
    'INTELLECT',
    'You have an exceptional memory, allowing you to recall information, events, or details with ease.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Knowledge',
    'INTELLECT',
    'You have a broad base of knowledge in various subjects, allowing you to recall facts and information quickly.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Understanding Numenera',
    'INTELLECT',
    'You are particularly skills at all actions which involve identifying or understanding numenera.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Sense Magic',
    'INTELLECT',
    'You can sense whether the numenera is active in situations where its presence is not obvious. You must study an object or location closely for a minute to get a feel for whether the touch of the ancients is at work.',
    0,
    0,
    0,
    'ACTION'
),
(
    'Hedge Magic',
    'INTELLECT',
    'You can perform simple tricks: temporarily change the colour or basic appearance of a small object, cause small objects to float through the air, clean a small area, mend a broken object, prepare (but not create) food, and so on. You can''t use hedge magic to harm another creature of object.',
    0,
    0,
    '1 Intellect Point',
    'ESOTERY'
),
(
    'Physical Skills',
    'MIGHT',
    'You are particularly skilled at all actions which involve physical prowess, such as climbing, jumping, or swimming.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Animal Handling',
    'MIGHT',
    'You''re skilled in all tasks involving training, riding, or placating natural animals.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Botany',
    'INTELLECT',
    'You have extensive knowledge of plants, fungi, and other flora, including their uses, habitats, and characteristics.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Stealth',
    'SPEED',
    'You''re skilled in all stealthy tasks.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Thievery',
    'SPEED',
    'You are skilled in all interactions involving lies or trickery.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Illusions and Trickery',
    'SPEED',
    'You are skilled in all esoteries or speical abilities involving illusions or trickery.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Breaking Things',
    'MIGHT',
    'You are skilled in all actions involving breaking inanimate objects.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Jumping',
    'SPEED',
    'You are skilled in all jumping-related tasks.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Mental Resistance',
    'INTELLECT',
    'You are skilled in resisting mental effects',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Focus',
    'INTELLECT',
    'You are skilled in tasks requiring incredible focus or concentration.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Initiative',
    'SPEED',
    'You are skilled in initiative actions (to determine who goes first in combat).',
    0, 
    0,
    0,
    'PASSIVE'
),
(
    'Running',
    'SPEED',
    'You are skilled in all running-related tasks.',
    0, 
    0,
    0,
    'PASSIVE'
),
(
    'Health',
    'MIGHT',
    'Add 1 to the points you regain when you make a recovery roll.',
    0, 
    0,
    0,
    'PASSIVE'
),
(
    'Might Defence',
    'MIGHT',
    'You''re skilled at all might defence skills.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Bash',
    'MIGHT',
    'This is a pummeling melee attack. Your attack inflicts 1 less point of damage than normal, but dazes your target for one round, during which time the difficulty of all tasks it performs is modified by one step to its detriment.',
    -1,
    0,
    1,
    'FIGHTING_MOVE'
),
(
    'No Need for Weapons',
    'CUSTOM',
    'When you make an unarmed attack (such as a punch or kick), it counts as a medium weapon instead of a light weapon.',
    0,
    0,
    0,
    'FIGHTING_MOVE'
),
(
    'Pierce',
    'SPEED',
    'This is a well-aimed, penetrating ranged attack. You make an attack and inflict 1 additional point of damage if your weapon has a sharp point',
    1,
    0,
    1,
    'FIGHTING_MOVE'
),
(
    'Thrust',
    'MIGHT',
    'This is a powerful melee stab. You make an attack and inflict 1 additional point of damage if your weapon has a sharp edge or point.',
    1,
    0,
    1,
    'FIGHTING_MOVE'
),
(
    'Trained Without Armour',
    'CUSTOM',
    'You are trained in Speed defense actions when not wearing armour.',
    0,
    0,
    0,
    'FIGHTING_MOVE'
),
(
    'No Need for Weapons',
    'SPECIAL_ABILITY',
    'When you make an unarmed attack (such as a punch or kick), it counts as a medium weapon instead of a light weapon.',
    0,
    0,
    0,
    'ENABLER'
),
(
    'Cypher Use',
    'SPECIAL_ABILITY',
    'You can bear two cyphers at a time.',
    0,
    0,
    0,
    'ENABLER'
),
(
    'Practiced in Armour',
    'SPECIAL_ABILITY',
    'You can wear armour for long period of time without tiring and can compensate for slowed reactions from wearing armour. You can wear any kind of armour. You reduce the Might cost per hour for wearing armour and the Speed Pool reduction for wearing armour by 2.',
    0,
    0,
    0,
    'ENABLER'
),
(
    'Practiced With All Weapons',
    'SPECIAL_ABILITY',
    'You can use any weapon',
    0,
    0,
    0,
    'ENABLER'
),
(
    'Skill With Attacks',
    'CUSTOM',
    'Choose one type of attack in which you are not already trained: light bashing, light bladed, light ranged, medium bashing, medium blaed, medium ranged, heavy bashing, heavy bladed, or heavy ranged. You are trained in attacks using that type of weapon.',
    0,
    0,
    0,
    'ENABLER'
),
(
    'Chop',
    'MIGHT',
    'This is a heavy, powerful slice with a bladed weapon, probably overhand. You must grip your weapon with two hands to chop. When making this attack, you take a -1 penalty to the attack roll, and you inflict 3 additional points of damage',
    3,
    0,
    2,
    'FIGHTING_MOVE'
),
(
    'Crush',
    'MIGHT',
    'This is a powerful pummeling attack with a bashing weapon, probably overhand. You must grip your weapon with two hands to crush. (If fighting unarmed, this attack is made with both fists or both feet together.) When making this attack, you take a -1 penalty to the attack roll, and you inflict 3 additional points of damage',
    3,
    0,
    2,
    'FIGHTING_MOVE'
),
(
    'Reload',
    'SPEED',
    'When using a weapon that normally requires an action to reload, such as a heavy crossbow, you can reload and fire (or fire and reload) in the same action',
    0,
    0,
    1,
    'FIGHTING_MOVE'
),
(
    'Skill With Defence',
    'CUSTOM',
    'Choose one type of defence task in which you are not already trained: Might, Speed or Intellect. You are trained in defense tasks of that type. Unlike most fighting moves, you can select this move upto three times. Each time you select it, you must choose a different type of defence task.',
    0,
    0,
    0,
    'FIGHTING_MOVE'
),
(
    'Successive Attack',
    'SPEED',
    'If you take down a foe, you can immediately make another attack on that same turn against a new foe within your reach. The second attack is part of the same action. You can use this fighting move with melee atacks and ranged attacks',
    0,
    0,
    2,
    'FIGHTING_MOVE'
),
(
    'Expert Cypher Use',
    'SPECIAL_ABILITY',
    'You can bear three cyphers at a time.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Experienced With Armour',
    'SPECIAL_ABILITY',
    'The cost reduction from your Practiced in Armour abilities improves. You now reduce the Might cost per hour and the Speed Pool reduction by 3',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Lunge',
    'MIGHT',
    'This move requires you to extend yourself for a powerful stab or smash. The awkward lunch increases the difficulty of the attack roll by one step. If your attack is successful, it inflicts 4 additional points of damage.',
    4,
    0,
    2,
    'FIGHTING_MOVE'
),
(
    'Slice',
    'SPEED',
    'This is a quick attack with a bladed or pointed weapon that is hart to defend against. The difficulty of the attack role is decreased by one step. If the attack is successful, it deals 1 less point of damage than normal.',
    -1,
    0,
    2,
    'FIGHTING_MOVE'
),
(
    'Spray',
    'SPEED',
    'If a wapon has the ability to fire rapid shots without reloading (usually called a rapid-fire weapon, such as the crank crossbow), you can spray multiple shots around your target to increase the chance of hitting. This move uses 1d6 + 1 rounds of ammo (or all the amo in the weapon, if it has less than the number rolled). This difficulty of the attack roll is decreased by one step. If the attack is successful, it deals 1 less point of damage than normal.',
    -1,
    0,
    2,
    'FIGHTING_MOVE'
),
(
    'Trick Shot',
    'SPEED',
    'As parts of the same action, you make a ranged attack against two targets that are within immediate range of each other. Make a separate attack roll against each target. The difficulty of each attack roll is increased by one step.',
    0,
    0,
    2,
    'FIGHTING_MOVE'
),
(
    'Capable Warrior',
    'SPECIAL_ABILITY',
    'Your attacks deal 1 additional point of damage.',
    1,
    0,
    0,
    'PASSIVE'
),
(
    'Experienced Defender',
    'SPECIAL_ABILITY',
    'When wearing armour, you gain +1 to Armour.',
    0,
    1,
    0,
    'PASSIVE'
),
(
    'Feint',
    'SPEED',
    'If you spend one action creating a misdirection or diversion, in the next round you can take advantage of your opponent''s lowered defences. Make a melee attack roll against that opponent. The difficulty of the roll is decreased by one step. If your attack is successful, it inflicts 4 additional points of damage.',
    4,
    0,
    2,
    'FIGHTING_MOVE'
),
(
    'Minor to Major',
    'SPECIAL_ABILITY',
    'You treat rolls of natural 19 as rolls of natural 20 for Might attack rolls or Speed attack rolls (your choice when you gain this ability). This allows you to gain a major effect on a natural 19 or 20.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Snipe',
    'SPEED',
    'If you spend one action aiming, in the next round you can make a precise ranged attack. The difficulty of the attack roll is decreased by one step. If your attack is successful, if inflicts 4 additional points of damage.',
    4,
    0,
    2,
    'FIGHTING_MOVE'
),
(
    'Adept Cypher Use',
    'SPECIAL_ABILITY',
    'You can bear four cyphers at a time.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Arc Spray',
    'SPEED',
    'If a weapon has the ability to fire rapid shots without reloading (usually called a rapid-fire weapon, such as the crank crossbow), you can fire your weapon at up to three targets (all next to one another) at once. Make a separate attack roll against each target. The difficulty of each attack is increased by one step.',
    0,
    0,
    3,
    'FIGHTING_MOVE'
),
(
    'Jump Attack',
    'MIGHT',
    'You attempt a diffuclty 4 Might action to jump high into the air as part of your melee attack. If you succeed, your attack inflicts 3 additional points of damage and knocks the foe down. If you fail, you still make your normal attack roll, but you don''t inflict the extra damage or knock down the opponent if you hit.',
    3,
    0,
    5,
    'FIGHTING_MOVE'
),
(
    'Mastery With Armour',
    'SPECIAL_ABILITY',
    'When you wear any armour, you reduce the armour''s penalties (Might cost and Speed reduction) to 0. If you select this fighting move and you already have the Experience With Armour move, you should replace Experience With Armour with a different third-tier move because Mastery With Armour is better.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Mastery With Defense',
    'CUSTOM',
    'Choose one type of defence task in which you are trained: Might Speed, or Intellect. YOu are specialised in defense tasks of that type. Unlike most fighting moves, you can select this move upto three times. Each time you select it, you must choose a different type of defense task.',
    0,
    0, 
    0,
    'PASSIVE'
),
(
    'Parry',
    'SPEED',
    'You can deflect incoming attacks quickly. When you activate this move, for the next 10 rounds you reduce the difficulty for all Speed defence rolls by one step.',
    0,
    0,
    5,
    'FIGHTING_MOVE'
),
(
    'Finishing Blow',
    'MIGHT',
    'If your foe is prone, stunned, or somehow helpless or incapacitated when you strike, you inflict 6 additional points of damage on a successful hit.',
    6,
    0,
    5,
    'PASSIVE'
),
(
    'Slayer',
    'MIGHT',
    'When you successfully strike an NPC or creature of level 5 or lower, make another roll (using whichever stat you used to attack). If you succeed on the second roll, you kill the target outright. If you use this fighting move against a PC or any tier and you succeed on the second roll, the character moves down one step on the damage track.',
    0,
    0,
    3,
    'FIGHTING_MOVE'
),
(
    'Spin Attack',
    'SPEED',
    'You stand stil and make melee attacks against up to five foes within reach, all as part of the same ations in one round. Make a separate attack roll for each foe. You remain limited by the amount of Effort you can apploy on one action. Anything that modifies your attack or damage applies to all of these attacks.',
    0,
    0,
    5,
    'FIGHTING_MOVE'
),
(
    'Weapon and Body',
    'SPEED',
    'After making a melee weapon or ranged weapon attack, you follow up with a punch or kick as an additional attack, all as part of the same action in one round. The two attacks can be directed at different foes. Make a separate attack roll for each attack. You remain limited by the amount of Effort you can apply on one action. Anything that modifies your attack or damage applies to both attacks, unless it is tied specifically to your weapon.',
    0,
    0,
    5,
    'FIGHTING_MOVE'
);