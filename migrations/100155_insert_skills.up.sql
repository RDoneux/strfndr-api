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
    'Trick of the Trade Slot',
    'CUSTOM',
    'This is a generic trick of the trade slot that can be customized by the player.',
    0,
    0,
    0,
    'TRICK_OF_THE_TRADE_SLOT'
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
    1,
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
),
(
    'Practiced With Light Weapons',
    'SPECIAL_ABILITY',
    'You can use light weapons without penalty. If you wield a medium weapon, increases the difficulty of the attack by one step. If you wield a heavy weapon, increase it by two steps.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Numenera Training',
    'SPECIAL_ABILITY',
    'You are trained in the numenera and can attempt to understand and identify its properties.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Onslaught',
    'INTELLECT',
    'You attack a foe using energies that asail either their physical form of their mind. In either case, you must be able to see your target. If the attack if physical, you emit a short-range ray of force that inflicts 4 points of damage. If the attack is mental, you focus your mental energy to blast the thought processes of another creature within short range. This mindslice inflicts 2 points of Intellect damage (and thus ignores Armour). Some creature swithout minds (such as automatons) might be immmune to mindslice.',
    4,
    0,
    1,
    'ESOTERY'
),
(
    'Push',
    'INTELLECT',
    'You push a creature or object an immediate distance in any direction you wish. You must be able to see the target, which must be your size or smaller, must not be afixed to anything, and must be within short range. The push is quick, and the force is too crude to be manipulated. For example, you can''t use this esotery to pull a lever or even close a door.',
    0,
    0,
    2,
    'ESOTERY'
),
(
    'Scan',
    'INTELLECT',
    'You scan an area equal in size to a 3 meter cube, including all objects or creatures within that area. The area must be within short range. Scanning a creature or object always reveals its level (a measure of how powervul, dangerous, or difficult it is.) You also learn whatever facts the GM feels are pertinent about the matter and energy in that area. For example, you might learn that the wooden bo contains a device of metal and synth. You might learn that the glass cylinder is full of poisonous gas, and that its metal stand has an electrical field running trhrough it that connects to a metal mesh in the floor. You might learn that the creature standing before you is a mammal with a small brain. However, this esotery doesn''t tell you wat the information means. Thus in the first example, you don''t know what the metal and synth device does. In the third, you might suspect that the creature is not very intelligent, but scans, like looks can be deceiving. Many materials and energy fieldfs prevent or resist scanning.',
    0,
    0,
    2,
    'ESOTERY'
),
(
    'Ward',
    'CUSTOM',
    'You have a shield of energy around you at all ties that helps deflect attacks. You gain +1 to Armour.',
    0,
    1,
    0,
    'PASSIVE'
),
(
    'Adaption',
    'INTELLECT',
    'You adapt to a hostile environment for 28 hours. As a result, you can breath safely, the temperature doesn''t kill you (though it might be extremely uncomfortable or debilitating), crushing gravity doesn''t incapacitate or harm you (though, again, you might be seriously hindered), and so on. In extreme environments, the GM might increase the cost of activating this esotery to a maximum cost of 10 Intellect points. Roughly speaking, the cost should equal the amount of damage you would sustain in a given round. For example, if you enter a hostile environment that would normally deal 6 points of damage per round, using Adaption to avoid that damage costs 6 points. You can protect other creatures in addition to yourself, but each additional creature costs you the same number of Intellect points as it costs to protect you. Thus, if it costs 6 points to protect yourself, it costs 12 more to protect two other people. This esotery never protects against quick, instantaneous threats, like an attack with a weapon or a sudden explosion of fire.',
    0,
    0,
    0,
    'ESOTERY'
),
(
    'Flash',
    'INTELLECT',
    'You create an explosion of energy at a point within close range, affecting an area up to immediate range from that point. You must be able to see the location where you intend to center the explosion. The blast inflicts 2 points of damage to all creatures or objects within the area. Because this is an area attack, adding Effort to increase the damage works differently than it does for single-target attacks; if you apply a level of Effort to increase the damage, add 2 points of damage for each target, and even if you fail your attack roll, all targets in the area still take 1 point of damage.',
    0,
    0,
    4,
    'ESOTERY'
),
(
    'Hover',
    'INTELLECT',
    'You float slowly into the air. If you concentrate, you can control your movement to remain motionless in the air, or float up to a short distance as your action, but not more; otherwise, you drift with the wind or with any momentum you have gained. This effect lasts for up to 10 minutes.',
    0,
    0,
    2,
    'ESOTERY'
),
(
    'Mind Reading',
    'INTELLECT',
    'You can read the surface thoughts of a creature within short range of you, even if the target doesn''t want you to. You must be able to see the target. Once you have established contact, you can read the target''s thoughts for up to one minute. If you or. the target move out of range, the connection is broken.',
    0,
    0,
    4,
    'ESOTERY'
),
(
    'Stasis',
    'INTELLECT',
    'You surround a foe or your size or smaller with scintillating energy, keeping it from moving or acting for one minute, as if frozen solid. You must be able to see the target, and it must be within short range. While in stasis, the target is impervious to harm, cannot be moved, and is immune to all effects.',
    0,
    0,
    3,
    'ESOTERY'
),
(
    'Barrier',
    'INTELLECT',
    'You create an opaque, stationary barrier of solid energy within immediate range. The barrier is 3 meters by 3 meters and of negligible thicknes. It is a level 2 barrier and lasts for ten minutes. It can be placed anywhere it fits, whether against a solid object (including the ground) or floating in the air. Each level of Effort you apply strengthens the barrier by one level. For example, applying two levels of Effort creates a level 4 barrier.',
    0,
    0,
    3,
    'ESOTERY'
),
(
    'Countermeasures',
    'INTELLECT',
    'You immediately end one ongoing numenera effect (such as an effect created by an esotery) within immediate range. Alternatively, you can use this as a defense action to cancel any incoming esotery targeted at you, or you can cancel any numenera device or the effect of any numenera device for 1d6 rounds. You ust touch the effect or device to cancel it.',
    0,
    0,
    4,
    'ESOTERY'
),
(
    'Energy Protection',
    'INTELLECT',
    'Choose a descrete type of energy that you have experience with (such as heat, sonic, electricity, and so on). You gain +10 to armour against damage from that type of energy for 10 minutes. Alternatively, you gain +1 to Armour against damage from that energy for 28 hours. You mustbe familiar with the type of energy; for example, if you have no experience with a certian kind of extrademensional energy, you can''t protect against it. Instead of applying Effort to decrease the difficulty of this esotery, you can apply Effort to protect more targets, with each level of Effort affecting up to two additional targets. You must touch additional targets to protect them.',
    0,
    0,
    3,
    'ESOTERY'
),
(
    'Sensor',
    'INTELLECT',
    'You create an immobile, invisible sensor within immediate range that lasts for 28 hours, At any time during that duration, you can concentrate to see, hear, and smell through the sensor, no matter how far you move from it. The sensor doesn''t grant you sensory capabilities beyond the norm.',
    0,
    0,
    4,
    'ESOTERY'
),
(
    'Targeting Eye',
    'SPECIAL_ABILITY',
    'You are trained in any physical ranged attack that is an esotery or comes from a numenera device. For example, you are trained when using an Onslaught force blast because it''s a physical attack, but not when using an Onslaught mindslice because it''s a mental attack.',
    0,
    0,
    0,
    'ESOTERY'
),
(
    'Invisibility',
    'INTELLECT',
    'You become invisible for ten minutes. While invisible, you are specialised in stealth and Speed defence tasks. This effect ends if you do something to reveal your presence or position - attacking, performing an esotery, using an ability, moving a large orbject, and so on. If this occurs, you can regain the remaining invisibility effect by taking an action to focus on hiding your position.',
    0,
    0,
    4,
    'ESOTERY'
),
(
    'Mind Control',
    'INTELLECT',
    'You control the actions of another creature you touch. This effect lasts for ten minutes. The target must be level 2 or lower. Once you have established control, you maintain mental contact with the target and sense what it senses. You can allow it to act feely or override its control on a case-by-case basis. Instead of applying Effort to decrease the difficulty, you can apply Effort to increase the maximum level of the target. Thus, to control the mind of a level 5 target (three levels above the normal limit), you must apply three levels of Effort. Smart nanos use the Scan esotery on a creature to learn its level before trying to control its mind. When the Mind Control esotery ends, the creature doesn''t remember being controlled or anything it did while under your command.',
    0,
    0,
    6,
    'ESOTERY'
),
(
    'Regeneration',
    'INTELLECT',
    'You restore points to a target''s Might or Speed Pool in one of two ways: either the chosen Pool regains up to 6 points, or it is restored to a total value of 12. You make this decision when you initiate this esotery. Points are regenerated at a rate of 1 point each round. You must maintain contact with the target the whole time. In no case can this raise a Pool higher than its maximum.',
    0,
    0,
    6,
    'ESOTERY'
),
(
    'Reshape',
    'INTELLECT',
    'You reshape matter within short range in an area no larger than a 5 meter cube. If you spend only one action on this esotery, the changes you make are crude at best. If you spend at least ten minutes and succeed at an appropriate crafting task (with a difficulty at least one step higher than normal due to the circumstances), you can make complex changes to the material. You can''t change the nature of the material, only its shape. Thus you can make a hole in a wall or floor, or you can seal one up. You can fashion a rudimentary sword from a large piece of iron. You can break or repair a chian. With multiple uses of this esotery, you could bring about large changes, making a bridge, a wall , or a similar structure.',
    0,
    0,
    6,
    'ESOTERY'
),
(
    'Slay',
    'INTELLECT',
    'You gather disrupting energy in your fingertip and touch a creature. If the target is an NPC or a creature of level 3 or lower, it dies. If the target is a PC or any tier, he moves down one step on the damage track.',
    0,
    0,
    6,
    'ESOTERY'
),
(
    'Absorb Energy',
    'INTELLECT',
    'You touch an object and absorb its energy. If you touch a cypher, you render it useless. If you touch an artifact, roll on the artifact''s depletion. If you touch another kind of powered machine or device, the GM determines whether its power is fully drained. In any case, you absorb energy from the objects touched and regain 1d10 Intellect points. If this would give you more Intellect than your Pool''s maximum, the extra points are lost, and you must make a Might defense roll. The difficulty of the roll is equal to the number of points over your maximum you absorbed. If you fail the roll, you take 5 points of damage and are unable to act for one round. You can use this esotery as a defense action when you''re the target of an incomming esotery. Doing so cancels the incoming esotery, and you absorb the energy as if it were a device.',
    0,
    0,
    7,
    'ESOTERY'
),
(
    'Dust to Dust',
    'INTELLECT',
    'You disintegrate one nonliving object that is smaller than you and whose level is less than or equal to your tier. You must touch the object to affect it. If the Gm feels it appropriate to the circumstances, you can disintegrate a portion of an object (the total volume of which is smaller than you) rather than the entire thing.',
    0,
    0,
    7,
    'ESOTERY'
),
(
    'Knowing the Unknown',
    'INTELLECT',
    'Tapping into the datasphere, you can ask the GM one question and get a general answer. The GM assigns a level to the question, so the more obscure the answer, the more difficult the task. Generally, knowledge that you could find by looking somewhere other than your current location is a level 1, and obscure knowledge of the past is level 7. Gaining knowledge of the future is impossible.',
    0,
    0,
    6,
    'ESOTERY'
),
(
    'Teleportation',
    'INTELLECT',
    'You instantaneously transmit yourself yourself to any location that you have seen or been to, no matter the distance, as long as it is on Earth (or whatever world you''re currently on). Instead of applying Effort to decrease the difficulty, you can apply Effort to bring other people with you, with each level of Effort affecting up tot three additional targets. You must touch any additional targets',
    0,
    0,
    6,
    'ESOTERY'
),
(
    'True Senses',
    'SPECIAL_ABILITY',
    'You can see in complete darkness up to 15 meters as if it were dim light. You recognise holograms, disuises, optical illusions, sound mimicry, and other such tricks (for all senses) for what they are.',
    0,
    0,
    0,
    'ESOTERY'
),
(
    'Control Weather',
    'INTELLECT',
    'You change the weather in your general region. If performed indorrs, this esotery creates only minor weather effects, such as mist, mild temperature changes, and so on. If performed outside, you can create rain, fog, snow, wind, or any other kind of normal (not overly severe) weather. The change lasts for a natural length of time, so a storm might last for an hour, fog for two or three hours, and snow for a few hours (or for ten minutes if it''s out of season). For the first ten minutes after activating this esotery, you can create more dramatic and more specific effects, such as lightening strikes, giant hailstones, twisters, hurricane force winds, and so on. These effects must occur within 305 meters of your location. You must spend your turn concetrating to create an effect or to maintain it in a new round. These effects inflict 6 points of damage each round.',
    0,
    0,
    10,
    'ESOTERY'
),
(
    'Move Mountains',
    'INTELLECT',
    'You exert a tremendous amount of physical force within 76 meters of you. You can push up to 10 tons of material up to 15 meters. This force can collapse buildings, redirect small rivers, or perform other dramatic effects.',
    0,
    0,
    9,
    'ESOTERY'
),
(
    'Traverse the Worlds',
    'INTELLECT',
    'You instantaneously transmit yourself to another planet, dimension, plane, or level of reality. You must known the destination exists; the GM will decide if you have enough information to confirm its existence and what the level of difficulty might be to reach the destination. Instead of applying Effort to decrease the difficulty, you can apply Effort to bring other people with you, with each level of Effort affecting up to three additional targets. You must touch any additional targets.',
    0,
    0,
    8,
    'ESOTERY'
),
(
    'Usurp Cypher',
    'SPECIAL_ABILITY',
    'Choose one cypher that you carry. The cypher must have an effect that is not instantaneous. You destroy the cypher and gain its power, which functions for you continously. You can choose a cypher when you gain this ability, or you can and make the choice later. However once usurp a cypher''s power, you cannot later switch to a different cypher - the esotery works only once.',
    0,
    0,
    0,
    'ESOTERY'
),
(
    'Practiced With Medium Weapons',
    'SPECIAL_ABILITY',
    'You can use medium weapons without penalty. If you wield a heavy weapon, increase the difficulty of the attack by one step.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Brute Finesse',
    'SPECIAL_ABILITY',
    'Sometimes a swift kick is just the trick to pooping open a lock or starting a reluctant piece of machinery. When you apply Effort to a noncombat Speed task, you can spend points from your Might Pool as if they came from your Speed Pool. For example, you could spend 3 Might points and 2 Speed points to apply two levels of Effort to picking a lock.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Experienced Adventurer',
    'SPECIAL_ABILITY',
    'When you use a noncombat skill successfully, if you didn''t roll a natural 19 or 20, you can apply a level of Effort (after the roll) to get a minor special effect. The stat points spent for this level of Effort must come from the same stat as the one used for the skill. Thus, if you made a Speed roll, the cost of the Effort comes from your Speed Pool. Applying the Effort doesn''t modify the difficulty of the task, only creates the minor effect.',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Enhancement',
    'INTELLECT',
    'You gain a +1 bonus to the Edge for one stat of your choice (Might, Speed, or Intellect) for ten minutes. You can have only one version of this trick in effect at a time. Action to initiate.',
    0,
    0,
    4,
    'TRICK_OF_THE_TRADE'
),
(
    'Analytical Combat',
    'SPECIAL_ABILITY',
    'Sometimes the most important muscle in a fight is your brain. If you can predict where an opponent will move next or see her weak spot, you can be a more successful combatant. When you apply Effort to a combat Might task or Speed task, you can also spend points from your Intellect Pool as if they came from your Might Pool or Speed Pool. For example, you could spend 3 intellect points and 2 might points to apply two levels of Effort to attacking with a sword. Enabler',
    0,
    0,
    0,
    'PASSIVE'
),
(
    'Transdimensional Weapon',
    'INTELLECT',
    'One melee weapon that you touch vibrates on a dimensional frequency so that it spans into other dimensions for one hour. During that time, it inflicts 1 additional point of damage on a successful hit and affects targets that can only be affected by special transdimensional effects such as those that are out of phase. Action to initiate.',
    1,
    0,
    3,
    'TRICK_OF_THE_TRADE'
),
(
    'Energy Protection',
    'INTELLECT',
    'Choose a descrete type of energy that you have experience with (such as heat, sonic, electricity, and so on). You gain +10 to armour against damage from that type of energy for 10 minutes. Alternatively, you gain +1 to Armour against damage from that energy for 28 hours. You mustbe familiar with the type of energy; for example, if you have no experience with a certian kind of extrademensional energy, you can''t protect against it. Instead of applying Effort to decrease the difficulty of this esotery, you can apply Effort to protect more targets, with each level of Effort affecting up to two additional targets. You must touch additional targets to protect them.',
    0,
    0,
    4,
    'TRICK_OF_THE_TRADE'
);