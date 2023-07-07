CREATE TABLE public.users (
                              id SERIAL PRIMARY KEY,
                              username VARCHAR(255) NOT NULL,
                              password VARCHAR(255) NOT NULL,
                              email VARCHAR(255) NOT NULL,
                              created_at TIMESTAMP NOT NULL DEFAULT NOW(),
                              updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE public.permissions (
                                    id SERIAL PRIMARY KEY,
                                    name VARCHAR(50) NOT NULL
);

CREATE TABLE public.user_permissions (
                                         id SERIAL PRIMARY KEY,
                                         user_id INTEGER REFERENCES users(id),
                                         permission_id INTEGER REFERENCES permissions(id)
);

INSERT INTO permissions (name)
VALUES
    ('user'),
    ('admin');

INSERT INTO users (username, password, email, created_at, updated_at)
VALUES
    ('user1', 'password123', 'user1@example.com', NOW(), NOW()),
    ('user2', 'password456', 'user2@example.com', NOW(), NOW()),
    ('user3', 'password789', 'user3@example.com', NOW(), NOW());

INSERT INTO user_permissions (user_id, permission_id)
VALUES
    ((SELECT id FROM users WHERE username = 'user1'), (SELECT id FROM permissions WHERE name = 'user')),
    ((SELECT id FROM users WHERE username = 'user2'), (SELECT id FROM permissions WHERE name = 'admin')),
    ((SELECT id FROM users WHERE username = 'user3'), (SELECT id FROM permissions WHERE name = 'user')),
    ((SELECT id FROM users WHERE username = 'user3'), (SELECT id FROM permissions WHERE name = 'admin'));
