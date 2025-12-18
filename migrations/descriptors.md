INSERT INTO focus (id, name, description, special_effect)
VALUES
-- 1
('f0000001-0000-0000-0000-000000000001', 'Bears a Halo of Fire', 
 'You radiate fire around yourself, intimidating foes and adding flair to your actions.',
 'Once per scene, you can activate your halo to deal 1d6 fire damage to enemies nearby.'),

-- 2
('f0000002-0000-0000-0000-000000000002', 'Carries a Quiver',
 'Skilled with bows and projectiles, you always have the right ammunition at hand.',
 'Gain +1 to attack rolls with ranged weapons and ignore penalties from difficult terrain for movement while attacking.'),

-- 3
('f0000003-0000-0000-0000-000000000003', 'Commands Mental Powers',
 'You harness the mind to manipulate objects and people, tapping into psychic energies.',
 'Once per day, you can attempt a mental power task with reduced difficulty.'),

-- 4
('f0000004-0000-0000-0000-000000000004', 'Controls Beasts',
 'Animals and beasts are drawn to your commands; you can calm, guide, or intimidate them.',
 'You can attempt to command or calm a natural beast once per scene without a skill roll.'),

-- 5
('f0000005-0000-0000-0000-000000000005', 'Controls Gravity',
 'You manipulate gravity subtly to move objects or alter the environment.',
 'Once per day, you can reduce or increase gravity in a small area, affecting movement or falls.'),

-- 6
('f0000006-0000-0000-0000-000000000006', 'Crafts Illusions',
 'You can create convincing visual, auditory, or sensory illusions to deceive others.',
 'You may create a simple illusion once per scene, influencing perception tasks.'),

-- 7
('f0000007-0000-0000-0000-000000000007', 'Crafts Unique Objects',
 'You are adept at inventing or assembling unusual devices, gadgets, or items.',
 'You may attempt a crafting task for an unusual item once per day with no tools required if materials are available.'),

-- 8
('f0000008-0000-0000-0000-000000000008', 'Employs Magnetism',
 'You can manipulate metal objects or magnetic fields for utility or combat.',
 'Once per day, you can move a small metallic object at a distance, or attract/repel metal to hinder opponents.'),

-- 9
('f0000009-0000-0000-0000-000000000009', 'Entertains',
 'You charm, amuse, or captivate others through performance and flair.',
 'Gain +1 to social rolls involving performance, storytelling, or persuasion during downtime or roleplay scenes.'),

-- 10
('f0000010-0000-0000-0000-000000000010', 'Exists Partially Out of Phase',
 'You can partially step out of normal space to evade attacks or slip through barriers.',
 'Once per scene, you may reduce a physical attack against you by one step or ignore a minor obstacle.'),

-- 11
('f0000011-0000-0000-0000-000000000011', 'Explores Dark Places',
 'You thrive in caves, ruins, and other low-light areas, finding your way where others struggle.',
 'You may move through difficult terrain in darkness without penalty and gain +1 to perception checks in low light.'),

-- 12
('f0000012-0000-0000-0000-000000000012', 'Fights With Panache',
 'You fight with style and flair, gaining confidence and daring in combat.',
 'Once per encounter, you may reroll a failed attack roll or add +1 to damage.'),

-- 13
('f0000013-0000-0000-0000-000000000013', 'Focuses Mind Over Matter',
 'You can overcome physical limitations through concentration and willpower.',
 'Gain +1 to recovery rolls or resistances against fatigue or physical strain once per day.'),

-- 14
('f0000014-0000-0000-0000-000000000014', 'Fuses Flesh and Steel',
 'You augment your body with cybernetic or exotic enhancements.',
 'Once per day, gain a temporary +1 bonus to Might-based tasks or damage rolls.'),

-- 15
('f0000015-0000-0000-0000-000000000015', 'Howls at the Moon',
 'You channel primal instincts and draw power from the natural world.',
 'Gain +1 to animal handling, perception, or intimidation once per scene.'),

-- 16
('f0000016-0000-0000-0000-000000000016', 'Hunts With Great Skill',
 'You excel at tracking, ambushing, and taking down prey or targets.',
 'Gain +1 to stealth, perception, or attack rolls when tracking or hunting a target.'),

-- 17
('f0000017-0000-0000-0000-000000000017', 'Leads',
 'You inspire others and coordinate teamwork effectively.',
 'Once per scene, you may grant one ally a +1 bonus to a task or roll.'),

-- 18
('f0000018-0000-0000-0000-000000000018', 'Lives in the Wilderness',
 'You thrive in natural environments and survive where others would struggle.',
 'Gain +1 to survival or perception tasks in outdoor or wilderness settings.'),

-- 19
('f0000019-0000-0000-0000-000000000019', 'Masters Defense',
 'You excel at protecting yourself and others from harm.',
 'Gain +1 to armor use or dodge tasks once per scene.'),

-- 20
('f0000020-0000-0000-0000-000000000020', 'Masters Weaponry',
 'You wield weapons with skill and precision, maximizing your combat effectiveness.',
 'Gain +1 to attack or damage rolls with chosen weapon type.'),

-- 21
('f0000021-0000-0000-0000-000000000021', 'Murders',
 'You strike fear into enemies and excel at lethal combat.',
 'Once per scene, gain +1 damage with melee attacks or critical strikes.'),

-- 22
('f0000022-0000-0000-0000-000000000022', 'Rages',
 'You channel intense fury to enhance physical actions.',
 'Once per scene, gain +1 Might-based damage or task rolls for a short duration.'),

-- 23
('f0000023-0000-0000-0000-000000000023', 'Rides the Lightning',
 'You manipulate electrical energy or move with astonishing speed.',
 'Once per day, you may add +1 to Speed-based tasks or create a minor electrical effect.'),

-- 24
('f0000024-0000-0000-0000-000000000024', 'Talks to Machines',
 'You communicate with or control devices and technological constructs.',
 'Gain +1 to repair, operate, or identify machines once per scene.'),

-- 25
('f0000025-0000-0000-0000-000000000025', 'Wears a Sheen of Ice',
 'You exude a chilling aura, hindering enemies and protecting yourself.',
 'Once per scene, reduce damage from one attack by 1 or impose -1 on nearby attackers’ rolls.'),

-- 26
('f0000026-0000-0000-0000-000000000026', 'Wields Power With Precision',
 'You execute abilities with careful control and minimal waste.',
 'Once per scene, increase effectiveness of a chosen action or power by +1.'),

-- 27
('f0000027-0000-0000-0000-000000000027', 'Wields Two Weapons at Once',
 'You are ambidextrous and can fight effectively with two weapons simultaneously.',
 'Gain +1 to attacks with your off-hand weapon or reduce penalties from dual-wielding.'),

-- 28
('f0000028-0000-0000-0000-000000000028', 'Works Miracles',
 'You can perform extraordinary acts, blending skill and fortune.',
 'Once per scene, reroll a failed task or ignore a minor obstacle.'),

-- 29
('f0000029-0000-0000-0000-000000000029', 'Works the Back Alleys',
 'You know the hidden routes, secrets, and underworld of cities.',
 'Gain +1 to stealth, negotiation, or perception tasks in urban environments.');
