INSERT INTO items (
    name,
    description,
    price,
    item_type,
    equip_location
)
VALUES 
    (
        'Light Armour Slot',
        'A slot for equipping light armour pieces.',
        0,
        'ARMOUR_SLOT',
        'TORSO'
    ),
    (
        'Leather jerkin',
        'A simple leather vest reinforced with metal studs or plates. Provides basic protection without restricting movement.',
        3,
        'ARMOUR',
        'TORSO'
    ),
    (
        'Hides and furs',
        'Clothing made from the hides and furs of various creatures. Offers minimal protection but is lightweight and flexible.',
        2,
        'ARMOUR',
        'TORSO'
    ),
    (
        'Armouring cloth',
        'A special fabric treated with advanced polymers to provide a degree of protection against physical harm while remaining comfortable to wear.',
        40,
        'ARMOUR',
        'TORSO'
    ),
    (
        'Micromesh',
        'A fine mesh of interwoven fibers that hardens upon impact, providing excellent protection while remaining lightweight and flexible.',
        50,
        'ARMOUR',
        'TORSO'
    ),
    (
        'Beastskin',
        'Armor made from the toughened skin of alien beasts, offering superior protection and durability.',
        5,
        'ARMOUR',
        'TORSO'
    ),
    (
        'Brigandine',
        'A type of body armor made of small steel plates sewn onto a fabric or leather garment',
        5,
        'ARMOUR',
        'TORSO'
    ),
    (
        'Chainmail hauberk',
        'A long shirt made of interlocking metal rings that provides excellent protection against slashing attacks',
        6,
        'ARMOUR',
        'TORSO'
    ),
    (
        'Metalweave vest',
        'A vest made from a lightweight metal alloy that provides superior protection without sacrificing mobility',
        40,
        'ARMOUR',
        'TORSO'
    ),
    (
        'Synth breastplate',
        'A breastplate made from synthetic materials that offer high durability and resistance to damage',
        50,
        'ARMOUR',
        'TORSO'
    ),
    (
        'Plate armour',
        'Heavy armor made from large metal plates that provide maximum protection at the cost of mobility',
        15,
        'ARMOUR',
        'TORSO'
    ),
    (
        'Scale armour',
        'Armor made from small, overlapping metal scales that provide good protection while allowing for flexibility',
        12,
        'ARMOUR',
        'TORSO'
    );

INSERT INTO armour (
    item_id,
    weight_type
)
VALUES 
    (
        (SELECT id FROM items WHERE name = 'Leather jerkin'),
        'LIGHT'
    ),
    (
        (SELECT id FROM items WHERE name = 'Hides and furs'),
        'LIGHT'
    ),
    (
        (SELECT id FROM items WHERE name = 'Armouring cloth'),
        'SPECIAL_LIGHT'
    ),
    (
        (SELECT id FROM items WHERE name = 'Micromesh'),
        'SPECIAL_LIGHT'
    ),
    (
        (SELECT id FROM items WHERE name = 'Beastskin'),
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Brigandine'),
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Chainmail hauberk'),
        'MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Metalweave vest'),
        'SPECIAL_MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Synth breastplate'),
        'SPECIAL_MEDIUM'
    ),
    (
        (SELECT id FROM items WHERE name = 'Plate armour'),
        'HEAVY'
    ),
    (
        (SELECT id FROM items WHERE name = 'Scale armour'),
        'HEAVY'
    );

INSERT INTO armour_pool_modifiers (
    armour_id,
    pool_type,
    modifier_value,
    edge_value
)
VALUES 
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Leather jerkin')),
        'MIGHT',
        -1,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Leather jerkin')),
        'SPEED',
        -2,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Leather jerkin')),
        'ARMOUR',
        1,
        0
    ),
        (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Hides and furs')),
        'MIGHT',
        -1,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Hides and furs')),
        'SPEED',
        -2,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Hides and furs')),
        'ARMOUR',
        1,
        0
    ),
        (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Armouring cloth')),
        'MIGHT',
        -1,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Armouring cloth')),
        'SPEED',
        -2,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Armouring cloth')),
        'ARMOUR',
        2,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Micromesh')),
        'MIGHT',
        -1,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Micromesh')),
        'SPEED',
        -2,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Micromesh')),
        'ARMOUR',
        2,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Beastskin')),
        'MIGHT',
        -2,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Beastskin')),
        'SPEED',
        -3,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Beastskin')),
        'ARMOUR',
        2,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Brigandine')),
        'MIGHT',
        -2,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Brigandine')),
        'SPEED',
        -3,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Brigandine')),
        'ARMOUR',
        2,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Chainmail hauberk')),
        'MIGHT',
        -2,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Chainmail hauberk')),
        'SPEED',
        -3,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Chainmail hauberk')),
        'ARMOUR',
        2,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Metalweave vest')),
        'MIGHT',
        -2,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Metalweave vest')),
        'SPEED',
        -3,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Metalweave vest')),
        'ARMOUR',
        3,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Synth breastplate')),
        'MIGHT',
        -2,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Synth breastplate')),
        'SPEED',
        -3,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Synth breastplate')),
        'ARMOUR',
        3,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Plate armour')),
        'MIGHT',
        -3,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Plate armour')),
        'SPEED',
        -5,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Plate armour')),
        'ARMOUR',
        3,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Scale armour')),
        'MIGHT',
        -3,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Scale armour')),
        'SPEED',
        -5,
        0
    ),
    (
        (SELECT item_id FROM armour WHERE item_id = (SELECT id FROM items WHERE name = 'Scale armour')),
        'ARMOUR',
        3,
        0
    )