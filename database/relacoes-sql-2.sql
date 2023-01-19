-- Active: 1674131452046@@127.0.0.1@3306

-- Práticas

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

INSERT INTO users (id, name, email, password)
VALUES
('u001', 'fulana', 'fulana@email.com', 'fulana123'),
('u002', 'ciclano', 'ciclano@email.com', 'ciclano123'),
('u003', 'beltrana', 'beltrana@email.com', 'beltrana123');

SELECT * FROM users;

-- Prática 2

CREATE TABLE follows (
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users (id),
    FOREIGN KEY (followed_id) REFERENCES users (id)
);

-- Pessoa A segue B e C e Pessoa B segue A

INSERT INTO follows (follower_id, followed_id)
VALUES
("u001", "u002"),  -- Pessoa A segue B
("u001", "u003"),  -- Pessoa A segue C
("u002", "u001");  -- Pessoa B segue A

SELECT * FROM follows;

-- Mostra Quem está seguindo

SELECT * FROM follows  -- DEFINE A TABELA A
INNER JOIN users  -- DEFINE A TABELA B
ON follows.follower_id = users.id;


--Prática 3

-- Mostra Quem está seguindo e quem não seguiu

SELECT * FROM follows  -- dEFINE A TABELA A
RIGHT JOIN users  -- DEFINE A TABELA B
ON follows.follower_id = users.id;  -- 4 = NULL NULL PQ Beltrana não segue ninguem, logo a linha users foi criado e também é NULL


-- Mostra quem esta seguindo e quem não seguiu

SELECT * FROM users  
LEFT JOIN follows
ON follows.follower_id = users.id;


-- Mostrando os dados da pessoa que foi seguida

SELECT
    follows.follower_id AS followerId,
    follows.followed_id AS followedId,
    users.name AS followerName,
    followedUsers.name AS followedName,
    users.email AS followerEmail
FROM follows
RIGHT JOIN users 
ON follows.follower_id = users.id
LEFT JOIN users AS followedUsers
ON follows.followed_id = followedUsers.id;





