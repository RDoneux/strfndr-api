INSERT INTO items (
    name,
    description,
    weight,
    price,
    item_type,
    equip_location
) VALUES 
    (
        'Backpack',
        'A sturdy pack for carrying gear. Can hold up to 30 lbs of items.',
        1.0,
        2,
        'EQUIPMENT',
        'TORSO'
    ),
    (
        'Back of light tools',
        'Contains small tongs, pliers, screwdriver, small hammer, small pry bar, lockpicks, 3m string, .09m of wire and miscellaneous screws and nails.',
        1.0,
        10,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Back of heavy tools',
        'Contains hammer, six spikes, crowbar, large tongs, chisel and 3m of light (but strong)metal cable.',
        1.0,
        12,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Bedroll',
        'A compact sleeping mat and blanket for one person.',
        1.0,
        2,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Book',
        'Provides an asset to any roll made concerning the subject of the book as long as the character has the book in their possession, can read it, and can devot half an hour to the task (or twice as long as normal, whichever is greater).',
        1.0,
        20,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Burlap sack',
        'A simple sack made of rough fabric.',
        1.0,
        1,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Compass',
        'A small device that shows direction relative to magnetic north.',
        1.0,
        10,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Crowbar',
        'A sturdy metal bar with a flattened, curved end for prying things open.',
        1.0,
        2,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Disguise kit',
        'Includes cosmetics, facial prostheses, and a few other tricks. Provides an asset to disguise tasks, lowering the difficulty by one step when you attempt to disguise yourself as another person',
        1.0,
        12,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Explorer''s pack',
        'Contains 15m of rope, rations for three days, three spikes, hammer, warm clothes, sturdy boots, three torches, and two minor glowglobes',
        1.0,
        20,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'First aid kit',
        'Contains bandages, a few tools, salves, and so on. Provides an asset to healing tasks, lowering the difficulty by one step when you attempt to heal yourself or another person',
        1.0,
        10,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Grappling hook',
        'A metal hook attached to a length of rope, used for climbing or securing the rope to a surface.',
        1.0,
        3,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Lockpicks',
        'A set of small tools used to pick locks.',
        1.0,
        5,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Matchsticks',
        'A small bundle of wooden sticks used to start fires.',
        1.0,
        1,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Musical Instrument',
        'A simple musical instrument, such as a flute or drum.',
        1.0,
        10,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Pouch',
        'A small bag for carrying coins or other small items.',
        1.0,
        1,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Rope (15 meters)',
        'A length of sturdy rope, useful for climbing or tying things together.',
        1.0,
        2,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Shield',
        'Asset for Speed defence tasks (decreases the diffuculty by one step).',
        1.0,
        3,
        'EQUIPMENT',
        'FOREARM'
    ),
    (
        'Tent',
        'Large enough to accommodate two people',
        1.0,
        3,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Torch',
        'A wooden stick with a flammable material at one end, used to provide light.',
        1.0,
        1,
        'EQUIPMENT',
        'HANDS'
    ),
    (
        'Ale',
        'A pint of alcoholic beverage.',
        1.0,
        3,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Wine',
        'A bottle of fermented grape juice.',
        1.0,
        3,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Boots',
        'Sturdy footwear for adventuring.',
        1.0,
        1,
        'EQUIPMENT',
        'FEET'
    ),
    (
        'Cigarettes',
        'A pack of tobacco cigarettes.',
        1.0,
        2,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Clothing',
        'A set of everyday clothes suitable for various environments.',
        1.0,
        1,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Meal',
        'A standard meal for one person.',
        1.0,
        1,
        'EQUIPMENT',
        'NONE'
    ),
    (
        'Rations (1 day)',
        'Packaged food sufficient to sustain one person for a day.',
        1.0,
        2,
        'EQUIPMENT',
        'NONE'
    );

INSERT INTO equipment (
    item_id
) 
VALUES 
    (
        (SELECT id FROM items WHERE name = 'Backpack')
    ),
    (
        (SELECT id FROM items WHERE name = 'Back of light tools')
    ),
    (
        (SELECT id FROM items WHERE name = 'Back of heavy tools')
    ),
    (
        (SELECT id FROM items WHERE name = 'Bedroll')
    ),
    (
        (SELECT id FROM items WHERE name = 'Book')
    ),
    (
        (SELECT id FROM items WHERE name = 'Burlap sack')
    ),
    (
        (SELECT id FROM items WHERE name = 'Compass')
    ),
    (
        (SELECT id FROM items WHERE name = 'Crowbar')
    ),
    (
        (SELECT id FROM items WHERE name = 'Disguise kit')
    ),
    (
        (SELECT id FROM items WHERE name = 'Explorer''s pack')
    ),
    (
        (SELECT id FROM items WHERE name = 'First aid kit')
    ),
    (
        (SELECT id FROM items WHERE name = 'Grappling hook')
    ),
    (
        (SELECT id FROM items WHERE name = 'Lockpicks')
    ),
    (
        (SELECT id FROM items WHERE name = 'Matchsticks')
    ),
    (
        (SELECT id FROM items WHERE name = 'Musical Instrument')
    ),
    (
        (SELECT id FROM items WHERE name = 'Pouch')
    ),
    (
        (SELECT id FROM items WHERE name = 'Rope (15 meters)')
    ),
    (
        (SELECT id FROM items WHERE name = 'Shield')
    ),
    (
        (SELECT id FROM items WHERE name = 'Tent')
    ),
    (
        (SELECT id FROM items WHERE name = 'Torch')
    ),
    (
        (SELECT id FROM items WHERE name = 'Ale')
    ),
    (
        (SELECT id FROM items WHERE name = 'Wine')
    ),
    (
        (SELECT id FROM items WHERE name = 'Boots')
    ),
    (
        (SELECT id FROM items WHERE name = 'Cigarettes')
    ),
    (
        (SELECT id FROM items WHERE name = 'Clothing')
    ),
    (
        (SELECT id FROM items WHERE name = 'Meal')
    ),
    (
        (SELECT id FROM items WHERE name = 'Rations (1 day)')
    );