INSERT INTO
    character_focus_tier_classifications (
        focus_id,
        tier,
        description,
        classification
    )   
VALUES (
        (
            SELECT id
            FROM character_focus
            WHERE
                name = 'Bears a Halo of Fire'
        ),
        1,
        'At your command, your entire body becomes shrouded in flames that last up to ten minutes. The fire doesn''t burn you, but it automatically inflects 2 points of damage to anyone who tries to touch you or strike you with a melee attack. Flames from another source can still hurt you. While the shroud is active, you gain +2 points of Armour that protect only against damage from fire from another source.',
        'Shroud of Flame (1 Intellect point)'
    ),
    (
        (
            SELECT id
            FROM character_focus
            WHERE
                name = 'Bears a Halo of Fire'
        ),
        2,
        'While your Shroud of Flame is active, you can reach into your halo and hurl a handlful of file at a target. This is a ranged attack with short range that deals 4 points of fire damage.',
        'Hurl Flame (2 Intellect points)'
    ),
    (
        (
            SELECT id
            FROM character_focus
            WHERE
                name = 'Bears a Halo of Fire'
        ),
        3,
        'While your Shroud of Flame is active, you can reach into your halo and produce a hand made of animate flame that is twice the size of a humans''s hand. The hand acts as you direct, floating in the air. Directing the hand is an action. Without a command, the hand does nothing. It can move a long distance in a round, but it never moves farther away from you than long range. The hand can grab, move, and cary things, but anything it touches takes 1 point of damage per round from the heat. The hand can also attack. It''s a level 3 creature and deals 1 extra point of damage from fire when it attacks. Once created, the hand lasts for ten minutes. Action to create; action to direct.',
        'Firey Hand of Doom (3 Intellect points)'
    ),
    (
        (
            SELECT id
            FROM character_focus
            WHERE
                name = 'Bears a Halo of Fire'
        ),
        4,
        'When you wish it, you extend your halo fo fire to cover a weapon you wield in flame for one hour. The flame ends if you stop holding or carrying the weapon. While the flame lasts, the weapon inflicts 2 additional points of damage.',
        'Flameblade (4 Intellect points)'
    ),
    (
        (
            SELECT id
            FROM character_focus
            WHERE
                name = 'Bears a Halo of Fire'
        ),
        5,
        'When you wish it, your halo sprouts three tendrils of flame that last for up to ten minutes. As an action, you can use the tendrils to attack, making a separate attack roll for each. Each tendril inflicts 4 points of damage. Otherwise, the attacks function as standard attacks. If you don''t use the tendrils to attacks, they remain but do nothing.',
        'Fire Tendrils (5 Intellect points)'
    ),
    (
        (
            SELECT id
            FROM character_focus
            WHERE
                name = 'Bears a Halo of Fire'
        ),
        6,
        'You reach into your halo and produce an automaton of fire that is your general shape and size. It acts as you direct each round. Directing the servant is an action, and you can command it only when you are within long range of it. Without a command, the servant continues to follow your previous command. You can also give it a simple programmed action, such as "Wait here, and attacke anyone who comes within short range until they''re dead." The servant lasts for ten minutes, is a level 5 creature, and deals 1 extra point of damage from fire when it attacks. Action to create; action to direct.',
        'Fire Servant (6 Intellect points)'
    );