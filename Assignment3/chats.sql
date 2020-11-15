CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    user_id VARCHAR(20) NOT NULL,
    user_password VARCHAR(20) NOT NULL,
    user_nickname VARCHAR(12) NOT NULL,
    profile_image_link VARCHAR(50),
    profile_text VARCHAR(100),
    is_quit TINYINT NOT NULL DEFAULT 0,
    date_of_join DATE NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE channels (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    channelName VARCHAR(12) NOT NULL,
    creatorId INT NOT NULL,
    link VARCHAR(50) NOT NULL,
    maxCapacity INT NOT NULL,
    isQuit TINYINT NOT NULL DEFAULT 0,
    creationDate DATE NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE chats (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    chatting VARCHAR(100) NOT NULL,
    creatorId INT NOT NULL,
    channelId INT NOT NULL,
    creationDate DATE NOT NULL,
    FOREIGN KEY (creatorId) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (channelId) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE follows (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    followerId INT NOT NULL,
    followeeId INT NOT NULL, 
    followDate DATE NOT NULL,
    CHECK (followerId <> followee_id),
    FOREIGN KEY (followerId) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (followeeId) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE blocks (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    blockingId INT NOT NULL,
    blockedId INT NOT NULL,
    blockDate DATE NOT NULL,
    CHECK (blockingId <> blockedId),
    FOREIGN KEY (blockingId) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (blockedId) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;