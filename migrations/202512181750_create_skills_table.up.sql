CREATE TABLE IF NOT EXISTS skills (
    id VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
    name VARCHAR(100) NOT NULL,
    category ENUM('Might', 'Speed', 'Intellect', 'General'),
    description TEXT
)