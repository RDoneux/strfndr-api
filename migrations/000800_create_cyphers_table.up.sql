CREATE TABLE cyphers (
    item_id VARCHAR(36) PRIMARY KEY,
    level SMALLINT DEFAULT 1,
    cypher_type ENUM('ANOETIC', 'OCCULTIC'),

    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
)