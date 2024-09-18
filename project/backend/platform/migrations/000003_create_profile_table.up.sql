-- Add UUID extension if not exists
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create user_profiles table
CREATE TABLE user_profiles (
    profile_id UUID DEFAULT uuid_generate_v4 () PRIMARY KEY,
    user_id UUID NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    bio TEXT,
    avatar_url VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP NULL,
    
    -- Foreign key to users table
    CONSTRAINT fk_user
        FOREIGN KEY(user_id) 
        REFERENCES users(id)
        ON DELETE CASCADE
);

-- Add an index on the user_id for faster lookups
CREATE INDEX idx_user_profiles_user_id ON user_profiles (user_id);

-- Insert mock data into user_profiles based on the mock users
INSERT INTO user_profiles (profile_id, user_id, first_name, last_name, bio, avatar_url, created_at)
VALUES
    (
        uuid_generate_v4(), 
        '11111111-1111-1111-1111-111111111111',  -- John Doe's user_id
        'John', 
        'Doe', 
        'Software Engineer with 10 years of experience in backend development.', 
        'https://example.com/john.jpg', 
        NOW()
    ),
    (
        uuid_generate_v4(), 
        '22222222-2222-2222-2222-222222222222',  -- Jane Smith's user_id
        'Jane', 
        'Smith', 
        'Experienced Product Manager passionate about user experience and design.', 
        'https://example.com/jane.jpg', 
        NOW()
    );

