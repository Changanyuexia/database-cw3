DROP TABLE IF EXISTS LikePost;
DROP TABLE IF EXISTS LikeTopic;
DROP TABLE IF EXISTS FavTopic;
DROP TABLE IF EXISTS Post;
DROP TABLE IF EXISTS Topic;
DROP TABLE IF EXISTS Forum;
DROP TABLE IF EXISTS Person;


CREATE TABLE Person (
   id INTEGER PRIMARY KEY,
   name VARCHAR(100) NOT NULL,
   username VARCHAR(10) NOT NULL UNIQUE,
   stuId VARCHAR(10) NULL
);

CREATE TABLE Forum (
   id INTEGER PRIMARY KEY,
   title VARCHAR(100) NOT NULL
);

CREATE TABLE Topic (
   id INTEGER PRIMARY KEY,
   title VARCHAR(100) NOT NULL,
   forum INTEGER REFERENCES Forum(id),
   creator INTEGER REFERENCES Person(id),
   created INTEGER NOT NULL
);

CREATE TABLE Post (
   id INTEGER PRIMARY KEY,
   topic INTEGER REFERENCES Topic(id),
   author INTEGER REFERENCES Person(id),
   content TEXT NOT NULL,
   created INTEGER NOT NULL
);

CREATE TABLE LikePost (
   person INTEGER REFERENCES Person(id),
   post INTEGER REFERENCES Post(id)
);

CREATE TABLE LikeTopic (
   person INTEGER REFERENCES Person(id),
   topic INTEGER REFERENCES Topic(id)
);

CREATE TABLE FavTopic (
   person INTEGER REFERENCES Person(id),
   topic INTEGER REFERENCES Topic(id)
);
