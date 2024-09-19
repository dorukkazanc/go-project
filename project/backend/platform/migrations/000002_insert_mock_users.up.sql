-- Description: Insert mock users into the users table. - 000002_insert_mock_users.up.sql

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

INSERT INTO users (created_at, updated_at, email, user_status, user_attrs) VALUES
    (
        NOW(),
        NOW(),
        'john.doe@example.com',
        1,
        '{"picture": "https://example.com/john.jpg", "first_name": "John", "last_name": "Doe", "about": "Software Engineer"}'
    ),
    (
        NOW(),
        NOW(),
        'jane.smith@example.com',
        1,
        '{"picture": "https://example.com/jane.jpg", "first_name": "Jane", "last_name": "Smith", "about": "Product Manager"}'
    );
    
