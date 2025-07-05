CREATE TABLE IF NOT EXISTS shelters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    location TEXT,
    email VARCHAR(30),
    phone VARCHAR(12),
    description TEXT
);