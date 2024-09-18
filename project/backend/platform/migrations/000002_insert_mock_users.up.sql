

INSERT INTO users (id, created_at, updated_at, email, user_status, user_attrs) VALUES
    (
        '11111111-1111-1111-1111-111111111111',
        NOW(),
        NOW(),
        'john.doe@example.com',
        1,
        '{"picture": "https://example.com/john.jpg", "first_name": "John", "last_name": "Doe", "about": "Software Engineer"}'
    ),
    (
        '22222222-2222-2222-2222-222222222222',
        NOW(),
        NOW(),
        'jane.smith@example.com',
        1,
        '{"picture": "https://example.com/jane.jpg", "first_name": "Jane", "last_name": "Smith", "about": "Product Manager"}'
    );
