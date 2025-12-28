CREATE TABLE IF NOT EXISTS items (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    name VARCHAR(100) NOT NULL,
    item_type ENUM(
        'Cypher',
        'Artifact',
        'Equipment',
        'Oddity'
    ) NOT NULL,
    source_book VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS cyphers (
    item_id VARCHAR(36) PRIMARY KEY,
    level INT,
    effect TEXT,
    cypher_type ENUM('Anoetic', 'Occultic'),
    FOREIGN KEY (item_id) REFERENCES items (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS artifacts (
    item_id VARCHAR(36) PRIMARY KEY,
    level INT,
    effect TEXT,
    depletion VARCHAR(20),
    FOREIGN KEY (item_id) REFERENCES items (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS equipment (
    item_id VARCHAR(36) PRIMARY KEY,
    cost INT,
    weight DECIMAL(5, 2),
    description TEXT,
    FOREIGN KEY (item_id) REFERENCES items (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS oddities (
    item_id VARCHAR(36) PRIMARY KEY,
    description TEXT,
    FOREIGN KEY (item_id) REFERENCES items (id) ON DELETE CASCADE
);