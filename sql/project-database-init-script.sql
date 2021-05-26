/*
 * Upon submission, this file should contain the SQL script to initialize your database.
 * It should contain all DROP TABLE and CREATE TABLE statments, and any INSERT statements
 * required...
 */

DROP TABLE IF EXISTS votes;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS users;


CREATE TABLE users (
    id INTEGER NOT NULL PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    username VARCHAR(20),
    dob DATE,
    password VARCHAR(50),
    description VARCHAR(300),
    imageSource VARCHAR(100)
);

CREATE TABLE articles (
    id INTEGER NOT NULL PRIMARY KEY,
    title VARCHAR(100),
    postTime TIMESTAMP,
    content VARCHAR(8000),
    imageSource VARCHAR(100),
    userID INTEGER,
    FOREIGN KEY (userID) REFERENCES users(id)
);

CREATE TABLE comments (
    id INTEGER NOT NULL PRIMARY KEY,
    postTime TIMESTAMP,
    content VARCHAR(300),
    upvotes INTEGER,
    downvotes INTEGER,
    parentCommentID INTEGER,
    commenterID INTEGER,
    articleID INTEGER,
    FOREIGN KEY (commenterID) REFERENCES users(id),
    FOREIGN KEY (articleID) REFERENCES articles(id),
    FOREIGN KEY (parentCommentID) REFERENCES comments(id)
);

CREATE TABLE votes (
    voterID INTEGER NOT NULL, 
    commentID INTEGER NOT NULL,
    PRIMARY KEY (voterID, commentID),
    FOREIGN KEY (voterID) REFERENCES users(id),
    FOREIGN KEY (commentID) REFERENCES comments(id)

);

INSERT INTO users VALUES (1, 'Johnny', 'Walker', 'walk', '1996-06-17', 'testpass', 'This is my description yayaya!', 'public\images\Dragonite.png');
INSERT INTO users VALUES (2,'Jim', 'Beam', 'getlit', '1993-01-11', 'newpass', 'Lorem Ipsum or something', 'public\images\Dragonite.png');
INSERT INTO users VALUES (3,'Jack', 'Daniels', 'jdbro', '2000-03-23', 'oldpass', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper ex eget dui rhoncus congue. Integer eget nisl laoreet nisl eleifend elementum.', 'public\images\Dragonite.png');

INSERT INTO articles VALUES (1, 'Fake Title 1', '2021-01-19 03:14:07','
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper ex eget dui rhoncus congue. Integer eget nisl laoreet nisl eleifend elementum. Nulla facilisis quis felis eget efficitur. Sed vel fringilla elit. Mauris et purus sem. Praesent nec magna lorem. Quisque condimentum scelerisque luctus. Nam finibus nisl sed purus porta, lobortis pretium neque vestibulum. In hac habitasse platea dictumst. Cras feugiat tristique massa a eleifend.', 'public\images\Dragonite.png', 1);

INSERT INTO articles VALUES (2, 'Fake Title 2', '2021-04-24 04:20:00','
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper ex eget dui rhoncus congue. Integer eget nisl laoreet nisl eleifend elementum. Nulla facilisis quis felis eget efficitur. Sed vel fringilla elit. Mauris et purus sem. Praesent nec magna lorem. Quisque condimentum scelerisque luctus. Nam finibus nisl sed purus porta, lobortis pretium neque vestibulum. In hac habitasse platea dictumst. Cras feugiat tristique massa a eleifend.', 'public\images\Dragonite.png', 2);

INSERT INTO articles VALUES (3, 'Fake Title 3', '2021-04-20 11:01:07','
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper ex eget dui rhoncus congue. Integer eget nisl laoreet nisl eleifend elementum. Nulla facilisis quis felis eget efficitur. Sed vel fringilla elit. Mauris et purus sem. Praesent nec magna lorem. Quisque condimentum scelerisque luctus. Nam finibus nisl sed purus porta, lobortis pretium neque vestibulum. In hac habitasse platea dictumst. Cras feugiat tristique massa a eleifend.', 'public\images\Dragonite.png', 3);

INSERT INTO comments VALUES (1, '2021-04-20 11:01:07', 'This article is so good OMG', 1, 0, NULL, 2, 1);
INSERT INTO comments VALUES (2, '2021-03-10 05:00:07', 'This article is so bad OMG', 0, 1, 1, 3, 1);
INSERT INTO comments VALUES (3, '2021-01-12 06:05:00', 'This article is average', 2, 0, NULL, 1, 3);
INSERT INTO comments VALUES (4, '2021-02-16 04:20:07', 'Good job lol', 0, 0, NULL, 1, 2);
INSERT INTO comments VALUES (5, '2021-01-14 08:40:06', 'LOLOLOLOL', 3, 0, 2, 1, 1);

INSERT INTO votes VALUES (1, 1);
INSERT INTO votes VALUES (2, 2);
INSERT INTO votes VALUES (3, 3);
INSERT INTO votes VALUES (2, 3);
INSERT INTO votes VALUES (1, 5);
INSERT INTO votes VALUES (2, 5);
INSERT INTO votes VALUES (3, 5);