CREATE TABLE IF NOT EXISTS shelters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    location TEXT,
    email VARCHAR(100),
    phone VARCHAR(20),
    description TEXT
);