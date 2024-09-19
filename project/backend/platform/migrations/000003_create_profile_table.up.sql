-- Description: The SQL script to create the user_profiles table. - 000003_create_profile_table.up.sql

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

INSERT INTO user_profiles (user_id, first_name, last_name, bio, avatar_url)
SELECT 
    id,
    user_attrs->>'first_name',
    user_attrs->>'last_name',
    user_attrs->>'about',
    user_attrs->>'picture'
FROM users
WHERE email IN ('john.doe@example.com', 'jane.smith@example.com');

