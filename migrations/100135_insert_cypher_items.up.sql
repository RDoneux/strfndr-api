INSERT INTO
    items (name, description, item_type)
VALUES (
        'Cypher Slot',
        'A slot for a cypher to be equipped.',
        'CYPHER_SLOT'
    ),
    (
        'Adhesion Clamps',
        'Handles with powerful suction cups.',
        'CYPHER'
    ),
    (
        'Antivenom',
        'Injector',
        'CYPHER'
    ),
    (
        'Attractor',
        'Small handheld device',
        'CYPHER'
    ),
    (
        'Banishing Nodule',
        'Crystal module affixed to a melee weapon',
        'CYPHER'
    ),
    (
        'Blinking Nodule',
        'Crsytal module affixed to armour',
        'CYPHER'
    ),
    (
        'CHEMICAL FACTORY',
        'Injector',
        'CYPHER'
    ),
    (
        'Comprehension Graft',
        'Small metalic disk',
        'CYPHER'
    ),
    (
        'Controlled Blinking Nodule',
        'Crystal nodule affixed to armour',
        'CYPHER'
    ),
    (
        'Datasphere Siphon',
        'Small handheld device, crystal. Also ingestible',
        'CYPHER'
    ),
    (
        'Density Nodule',
        'Crystal module affixed to a melee weapon',
        'CYPHER'
    ),
    (
        'Detonation',
        'Wristband projector (long range). Explosive device (thrown, short range) or handheld projector (long range)',
        'CYPHER'
    ),
    (
        'Detonation (Disiccating)',
        'Wristband projector (long range). Explosive device (thrown, short range) or handheld projector (long range)',
        'CYPHER'
    ),
    (
        'Detonation (Flash)',
        'Wristband projector (long range). Explosive device (thrown, short range) or handheld projector (long range)',
        'CYPHER'
    ),
    (
        'Detonation (Gravity)',
        'Wristband projector (long range). Explosive device (thrown, short range) or handheld projector (long range)',
        'CYPHER'
    ),
    (
        'Detonation (Massive)',
        'Wristband projector (long range). Explosive device (thrown, short range) or handheld projector (long range)',
        'CYPHER'
    ),
    (
        'Detonation (Matter Disruption)',
        'Wristband projector (long range). Explosive device (thrown, short range) or handheld projector (long range)',
        'CYPHER'
    ),
    (
        'Detonation (Pressure)',
        'Wristband projector (long range). Explosive device (thrown, short range) or handheld projector (long range)',
        'CYPHER'
    ),
    (
        'Detonation (Singularity)',
        'Explosive device (thrown, short range) or handheld projector (long range)',
        'CYPHER'
    ),
    (
        'Detonation (Sonic)',
        'Wristband projector (long range).',
        'CYPHER'
    ),
    (
        'Detonation (Spawn)',
        'Explosive device or ceramic sphere (thrown, short range) or handheld projector (long range)',
        'CYPHER'
    ),
    (
        'Detonation (Web)',
        'Exposive device (thrown, short range) or handheld projector (long range)',
        'CYPHER'
    ),
    (
        'Disrupting Nodule',
        'Crystal module affixed to a melee weapon',
        'CYPHER'
    ),
    (
        'Eagleseye',
        'Pill, injestible liquid',
        'CYPHER'
    ),
    (
        'Fireproofing Spray',
        'Spray canister',
        'CYPHER'
    ),
    (
        'Flame-Retardant Wall',
        'Handheld device',
        'CYPHER'
    ),
    (
        'Force Cube Projector',
        'Handheld device',
        'CYPHER'
    ),
    (
        'Force Nodule',
        'Crystal module affixed to armour',
        'CYPHER'
    ),
    (
        'Force Screen Projector',
        'Handheld device',
        'CYPHER'
    ),
    (
        'Force Shield Projector',
        'Handheld device / subdermal injection',
        'CYPHER'
    ),
    (
        'Friction-Reducing Gel',
        'Spray canister',
        'CYPHER'
    ),
    (
        'Frigid Wall Projector',
        'Complex Device',
        'CYPHER'
    ),
    (
        'Gas Bomb',
        'Explosive device (thrown, short range) or handheld projector (long range)',
        'CYPHER'
    ),
    (
        'Gravity Nullifier',
        'Small platform on which the user must stand',
        'CYPHER'
    ),
    (
        'Gravity-Nullifying Spray',
        'Spray canister',
        'CYPHER'
    ),
    (
        'Heat Nodule',
        'Crystal module affixed to a melee weapon',
        'CYPHER'
    ),
    (
        'Hunter/Seeker',
        'Complex device, handheld device',
        'CYPHER'
    ),
    (
        'Image Projector',
        'Handheld device with glass panel',
        'CYPHER'
    ),
    (
        'Inferno Wall Projector',
        'Complex Device',
        'CYPHER'
    ),
    (
        'Infiltrator',
        'Handheld device that launches projectile',
        'CYPHER'
    ),
    (
        'Instant Servant',
        'Handheld device',
        'CYPHER'
    ),
    (
        'Intant Shelter',
        'Handheld device',
        'CYPHER'
    ),
    (
        'Intellect Enhancement',
        'Pill, ingestible liquid',
        'CYPHER'
    ),
    (
        'Invisibility Nodule',
        'Crystal module affixed to armour',
        'CYPHER'
    ),
    (
        'Knowledge Enhancement',
        'Pill, ingestible liquid',
        'CYPHER'
    ),
    (
        'Lightning Wall Projector',
        'Complex Device',
        'CYPHER'
    ),
    (
        'Living Solvent',
        'Canister containing slime',
        'CYPHER'
    ),
    (
        'Machine Control Implant',
        'Injector',
        'CYPHER'
    ),
    (
        'Magnetic Attack Drill',
        'Small sphere with a thick screw protrusion',
        'CYPHER'
    );

INSERT INTO
    cyphers (
        item_id,
        level_descriptor,
        effect
    )
VALUES (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Adhesion Clamps'
        ),
        '1d6',
        'Allows for automatic climbing of any surface, even horizontal ones. Lasts for twenty minutes.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Antivenom'
        ),
        '1d6 + 2',
        'Renders user immmune to poisons of the same level or lower (and ends any such ongoing effects if any already in the user''s system).'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Attractor'
        ),
        '1d6 + 4',
        'One unanchored item your size or smaller within long range is drawn immediately to the device. This takes one round. The item has no momentum when it arrives.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Banishing Nodule'
        ),
        '1d6',
        'For the next 28 hours, each time the weapon the nodule is attached to strikes a solid creature or object, it generates a burst of engery that teleports the creature or object struck an immediate distance in a random direction (not up or down). The difficulty of the dteleported creature''s actions (including defence) is modified by one step to its detriment on its next turn.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Blinking Nodule'
        ),
        '1d6',
        'For the next 28 hours, each time (but not more than once per round) the wearer of the armour the nodule is attached to is struck hard enough to inflict damage, he teleports an immediate distance in a random direction (not up or down). The difficulty of the teleported creature''s actions (including defence) is modified by one step to its detriment on its next turn.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'CHEMICAL FACTORY'
        ),
        '1d6',
        'After one hour, the sweat of the user produces 1d6 doses of a valuable liquid (these doses are not considered cyphers). They must be used within one week. Effects vary: (see Numera Core Rules 2013 ed. p283).'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Comprehension Graft'
        ),
        '1d6 + 1',
        'When applied to a creature''s head, the disk immediately unleashes microfilaments that enter the brain. Within 5 minutes, the creature can understand the wrods of a specific language keyed into the graft. This is true even of creatures that do not normally have a langugae. If the creature could already understand the langugae, the cypher has no effect. Once the graft attaches, the effect is permanent, and this device no longer counts against the number of cyphers that a PC can bear.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Controlled Blinking Nodule'
        ),
        '1d6 + 2',
        'For the next 28 hours, each time the wearer of the armour the nodule is attached to is struck hard enough to inflict damage (but no more than once per round), he teleports to a spot he desires within immediate range. Since the wearer is prepared for this effect and his foe is not, the difficulty of the werer''s defence is modified by one step to his benefit for one round after he telports.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Datasphere Siphon'
        ),
        '1d6',
        'Tapping into the datasphere''s knowledge, the user can learn the answer to one question.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Density Nodule'
        ),
        '1d6',
        'For the next 28 hours, each time the weapon the nodule is attached to strikes a solid creature or object, the weapon suddenly increases dramatically in weight, causing the blow to inflict an additional 2 points of damage.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation'
        ),
        '1d6 + 2',
        'Exlodes in an immediate radius, inflicting damage equal to the cypher level. Roll for the type of damage ((see Numera Core Rules 2013 ed. p284)).'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Disiccating)'
        ),
        '1d6 + 2',
        'Bursts in an immediate radius, draining moisture from everything within it. Living creatures take damage equal to the cypher level. Water in the area is vaporised.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Flash)'
        ),
        '1d6 + 2',
        'Bursts in daan immediate radius, blinding all within it for one minute.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Gravity)'
        ),
        '1d6 + 2',
        'Bursts in an immediate radius, inflicting damage equal to the cypher level by increasing gravity tremendously for one second. All in the area are crushed to the ground for one round and cannot take physical actions.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Massive)'
        ),
        '1d6 + 2',
        'Explodes in short range radius, inflicting damage equal to the cypher level. Roll for the type of damaage (see Numera Core Rules 2013 ed. p284).'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Matter Disruption)'
        ),
        '1d6 + 2',
        'Explodes in an immediate radius, releasing nanites that rearrange matter in random ways, inflicts damage equal to the cypher level.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Pressure)'
        ),
        '1d6 + 2',
        'Explodes in an immediate radius, inflicting impact damage equal to cypher level. Also moves unattended objects out of the area if they weigh less than 9kg per cypher level.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Singularity)'
        ),
        '10',
        'Explodes and creates a momentary singularity that tears at the fabric of the universe. Inflicts 20 points of damage to all within short range, drawing them (or their remains) together to immediate range (if possible). Player characters in the radius move on step down the damage track if they fail a Might defence roll.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Sonic)'
        ),
        '1d6 + 2',
        'Explodes with terrifying sound, deafening all in an immediate radius.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Spawn)'
        ),
        '1d6 + 2',
        'Bursts in an immediate radius, blinding all within it for one minute and inflicting damage equal to the cypher level. The burst spawns 1d6 additional detonations; on the next round, each additional detonation flies to a random spot within short range and explodes in an immediate radius. Roll for the type of damage dealt (see Numera Core Rules 2013 ed. p285).'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Web)'
        ),
        '1d6 + 2',
        'Explodes in an immediate radius and creates sticky strands of goo. PC''s caught in the area must use a Might-based action to get out, with the difficulty determined by the cypher level. NPC''s break free if their level is higher than the cypher level.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Disrupting Nodule'
        ),
        '1d6',
        'For the next 28 hours, each time the weapon the nodule is attached to strikes a solid creature or object, it generates a burst of nanites that directly attack organic cells. The affected target takes 1 additional point of damage and loses his next action.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Eagleseye'
        ),
        '1d6',
        'Grants the ability to see ten times as far as normal for one hour.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Fireproofing Spray'
        ),
        '1d6 + 4',
        'A nonliving object strayed by this cypher has Armour against fire damage equal to the cypher''s level for 28 hours.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Flame-Retardant Wall'
        ),
        '1d6',
        'Creates an immobile plane of permeable energy upto 6.1 by 6.1 meters for one hour. The plane conforms to the space available. Flames passing through the plane are extinguished.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Force Cube Projector'
        ),
        '1d6 + 3',
        'Creates an immobile cube composed of six planes of solid force, each 9.1 meters to a side for one hour. The planes conform to the space available.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Force Nodule'
        ),
        '1d6',
        'For the next 28 hours, the armour the nodule is attached to is bolstered by a powerful force field, adding 2 to the Armour it provides.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Force Screen Projector'
        ),
        '1d6 + 3',
        'Creates an immobile plane of solid force upto 6.1 by 6.1 meters for one hour. The plane conforms to the space available.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Force Shield Projector'
        ),
        '1d6 + 3',
        'Creates a shimmering energy shield around the user for one hour, during which time he gains +3 Armour (+4 Armour if the cypher is level 5 or higher).'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Friction-Reducing Gel'
        ),
        '1d6',
        'Sprayed across an area up to 3 meters square, this gel makes things extremely slippery. For one hour, the difficulty of movement tasks in the area is increased by three steps.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Frigid Wall Projector'
        ),
        '1d6 + 2',
        'Creates a wall of supercooled air upto 9.1 meters by 9.1 meters by 0.3 meters that inflicts damage equal to the sypher level on anything that passes through it. The wall conforms to the space available. It lasts ten minutes.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Gas Bomb'
        ),
        '1d6 + 2',
        'Bursts in a poisonous cloud within an immediate distance. The cloud lingers for 1d6 rounds unless conditions dictate otherwise. (see Numera Core Rules 2013 ed. p287).'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Gravity Nullifier'
        ),
        '1d6 + 3',
        'For one hour, the user can fload into the air, moving vertically (but not horizontally without some other action such as pushing along the ceiling) upto a short distance per round. The user must weigh less than 22kg per level of the cypher.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Gravity-Nullifying Spray'
        ),
        '1d6 + 2',
        'A nonliving object about the size of a person or smaller sprayed by this cypher floats 1d20 feet in the air permanently and no longer has weight if carried (though it needs to be strapped down).'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Heat Nodule'
        ),
        '1d6',
        'For the next 28 hours, each time the weapon the nodule is attached to strikes a solid creature or object, it generates a burst of heat, inflicting an additional 2 points of damage.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Hunter/Seeker'
        ),
        '1d6',
        'With the long-range movement, this intelligent missile tracks and attacks a specified target (target must be within sign when selected). If it misses, it continues to attack one additional time per cypher level until it hits. For example, a level 4 hunter/seeker will attack a maximum of five times. Different hunter/seekers have different effects (see Numera Core Rules 2013 ed. p287).'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Image Projector'
        ),
        '1d6',
        'Projects one of the following immoile images in the area described for one hour. The image appears 7.6 meters away from the user. Scenes include movement, sound and smell (see Numera Core Rules 2013 ed. p288).'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Inferno Wall Projector'
        ),
        '1d6 + 2',
        'Creates a wall of extreme heat upto 9.1 by 9.1 meters by 0.3 meters that inflicts damage equal to the cypher level on anything that passes through it. The wall conforms to the space available. It lasts for ten minutes.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Infiltrator'
        ),
        '1d6',
        'Tiny capsule launches and moves at great speed, mapping and scanning an unknown area. It moves 152 meters per level, scanning an area up to 15 meters per level away from it. It identifies basic layout, creatures, and major energy sources. Its movement is blocked by any physical or energy barrier.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Instant Servant'
        ),
        '1d6',
        'Small device expands into a humanoid automation that is roughly 0.6 meters tall. It is a creature equal to the cypher level and can understand the verbal commands of the character who activates it. Once activated, commanding the servant is not an action. It can make attacks or perform actions as ordered to the best of its abilities, but it cannot speak. The automaton has short-range movement but never goes farther than long range away from the character who activated it. At the GM''s discretion, the servant might have specialised knowledge, such as how to operate a particular device. Otherwise, it has no special knowledge. In any case, the servant is not artificially intelligent or capable of initiating action. It does only as commanded. Ther servant operates for one hour per cypher level.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Intant Shelter'
        ),
        '1d6 + 3',
        'With the addition of water and air, the small device expands into a simple one-room structure with a door and stransparent window. The structure is 3 by 3 by 6.1 meters. It is made from a form of shapestone and is permanent and immobile once created.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Intellect Enhancement'
        ),
        '1d6 + 2',
        'Substance adds 1 to Intellect Edge for one hour'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Invisibility Nodule'
        ),
        '1d6',
        'For the next 28 hours, the armour the nodule is attached to is invisible, making the wearer appear to be unarmoured.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Knowledge Enhancement'
        ),
        '1d6',
        'For the next 28 hours, the character has training in a predetermined skill. Although the skill could be anything including something specific to the operation of one device or something similar, common skills include (see Numera Core Rules 2013 ed. p289).'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Lightning Wall Projector'
        ),
        '1d6 + 2',
        'Creates a wall of electric bolts up to 9.1 by 9.1 meters by 0.3 meters that inflicts damage equal to the cypher level on anything that passes through it. The wall conforms to the space available. It lasts for ten minutes.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Living Solvent'
        ),
        '1d10',
        'Once released, this organic slime dissolves 1 cubic foot of material each round. After one round per cypher level, the slime dies and becomes inert.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Machine Control Implant'
        ),
        '1d6 + 2',
        'When activated, the cypher splits into two pieces. Once is affixed to a numenera device and the other to a character. The character can then use his mind t ocontrol the device at long range, biding it to do anything it could do normally. Thus a device could be activated or deactivated, and avehicle could be piloted. The control lasts for ten minutes, and once the device is chosen, it cannot be changed.'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Magnetic Attack Drill'
        ),
        '1d6 + 2',
        'The user throws this cypher at a target within short range, and it drills into the target for one round, inflicting damage equal to the cypher level. If the target is made of metal or wearing metal (such as armour), the difficulty of the attack is increased by one step.'
    );

INSERT INTO
    item_equip_locations (item_id, equip_location)
VALUES (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Cypher Slot'
        ),
        'NONE'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Adhesion Clamps'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Antivenom'
        ),
        'NONE'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Attractor'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Banishing Nodule'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Blinking Nodule'
        ),
        'TORSO'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'CHEMICAL FACTORY'
        ),
        'NONE'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Comprehension Graft'
        ),
        'HEAD'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Controlled Blinking Nodule'
        ),
        'TORSO'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Datasphere Siphon'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Density Nodule'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Disiccating)'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Flash)'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Gravity)'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Massive)'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Matter Disruption)'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Pressure)'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Singularity)'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Sonic)'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Spawn)'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Detonation (Web)'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Disrupting Nodule'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Eagleseye'
        ),
        'NONE'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Fireproofing Spray'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Flame-Retardant Wall'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Force Cube Projector'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Force Nodule'
        ),
        'TORSO'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Force Screen Projector'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Force Shield Projector'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Friction-Reducing Gel'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Frigid Wall Projector'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Gas Bomb'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Gravity Nullifier'
        ),
        'FEET'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Gravity-Nullifying Spray'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Heat Nodule'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Hunter/Seeker'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Image Projector'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Inferno Wall Projector'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Infiltrator'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Instant Servant'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Intant Shelter'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Intellect Enhancement'
        ),
        'NONE'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Invisibility Nodule'
        ),
        'TORSO'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Knowledge Enhancement'
        ),
        'NONE'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Lightning Wall Projector'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Living Solvent'
        ),
        'HANDS'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Machine Control Implant'
        ),
        'NONE'
    ),
    (
        (
            SELECT id
            FROM items
            WHERE
                name = 'Magnetic Attack Drill'
        ),
        'HANDS'
    );