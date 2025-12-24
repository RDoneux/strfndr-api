INSERT INTO notes (
    character_id,
    title,
    content
) VALUES
(
    (SELECT id FROM characters WHERE name = 'Test Character'),
    'Test Note Title 1',
    'This is the content of test note 1.'
)