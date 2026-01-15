INSERT INTO character_types (
    name,
    description,
    source_book
) VALUES (
    'Glaive',
    'Glaives are the elete warriors of the Ninth World, using weapons and armour to fight their enemies. Hunters, gardians, and soldiers could be glaives. Sometimes scouts, warlords, bandits and even athletes are glaives. "Glaive" is a commmon slang term used almost everywhere in the Steadfast and the Beyond for any person skilled with weapons of a martial art, but in truth, it applies only to the best of the best. Glaives are warriors who command abilities far beyond those of a typical person with a sword. Most glaives are either strong - using the heaviest armour and weapons available and having a high Might - or fast, sticking with light weapons and armour and having a high Speed. A few attempt to use both Might and Speed and stay somewhere in the middle. Glaives also use ranged weapons such as bows or darts. Some don''t rely on weapons at all, preferring to use their bodies in hand-to-hand combat - bunching, kicking, grabbing, throwing, and so on.',
    'Core Rulebook 2013'
),
(
    'Nano',
    'Nanos are sometimes called mages, wizards, sorcerers or witches by the people of the Ninth World. Nano-sorcerer is also a common term, with their abilities referred to as nano-sorcery. Some claim to be the representitives of gods or other supernatural agencies. Whatever they''re called, nanos master the mysteries of the past to the degree that they seem to perform miracles. They tap into the numenera to alter reailty or learn things that they couldn''t otherwise know. The term "nano" is derived from the nanotechnology that is omnipresent throughout the Ninth World (wether anyone realises it or not). Sometimes people call these invisible, numinous perticles that infuse the langscape nano-spirits. Sometimes these spirits take on a devastating manifestation called the Iron Wind and move through the air in clouds, which can be far more dangerous than any conventional storm. In truth nanites are literally everywhere. Nanos wield their power in the form of what they call esoteries, although some prefer to call them spells, enchantments, or charms. Nanos are proficient with other devices as well, and sometimes their powers are actually the subtle use of such items hidden upon their person. All nanos call forther their power in slightly different ways. Typically nanos are intelligent, learned and insightful. Most of the time, they devote themselves to the numenera and other esoterica rather than purely physical persuites. As a result, they''re often well versed in the artifacts and leftovers of the pervous eras.',
    'Core Rulebook 2013'
),
(
    'Jack',
    'Jacks are intrepid explorers and adventurers. They are jacks of all trades - hence the name - although the word also hearkens back to fables involving a wily resorceful hero who always seems to be named Jack. Used as a verb, "to jack" means to steal, to deceive, or to get out of a tight scrape through ingenuity or luck. Jacks don''t use one skill or tactic exclusively, they use whatever weapons, armour, esoteries or anything else that might help them. They are hunters, (particularly treasure hunters), con artists, skalds, rogues, scouts, and experts in a variety of fields.',
    'Core Rulebook 2013'
);

INSERT INTO character_types_pool_modifiers (
    character_type_id,
    pool_type,
    modifier_value,
    edge_value
) VALUES (
    (SELECT id FROM character_types WHERE name = 'Glaive'),
    'MIGHT',
    11,
    0
),
(
    (SELECT id FROM character_types WHERE name = 'Glaive'),
    'SPEED',
    10,
    0
),
(
    (SELECT id FROM character_types WHERE name = 'Glaive'),
    'INTELLECT',
    7,
    0
),
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    'MIGHT',
    7,
    0
),
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    'SPEED',
    9,
    0
),
(
    (SELECT id FROM character_types WHERE name = 'Nano'),
    'INTELLECT',
    12,
    0
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    'MIGHT',
    10,
    0
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    'SPEED',
    10,
    0
),
(
    (SELECT id FROM character_types WHERE name = 'Jack'),
    'INTELLECT',
    10,
    0
);