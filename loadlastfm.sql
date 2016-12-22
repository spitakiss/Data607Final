-- loadlastfm.sql

DROP SCHEMA IF EXISTS lastfm_db;

CREATE SCHEMA lastfm_db;
USE lastfm_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS user_artist;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS artist_tag;


CREATE TABLE users (
	user_id  INT PRIMARY KEY,
    user_nm VARCHAR(35) NOT NULL,
    country VARCHAR(35),
    ttl_user_ct INT NOT NULL
 );

LOAD DATA LOCAL INFILE 'C:/Users/Aaron/Google Drive/Documents/cuny/Data607/FinalProject/new2/users.csv' 
INTO TABLE users 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


 
CREATE TABLE artists (
	artist_id INT PRIMARY KEY,
    artist_nm VARCHAR(507)
    #mbid CHAR(36) NOT NEEDED FOR ANALYSIS 
);

LOAD DATA LOCAL INFILE 'C:/Users/Aaron/Google Drive/Documents/cuny/Data607/FinalProject/new2/artists.csv' 
INTO TABLE artists 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



CREATE TABLE tags (
	tag_id INT PRIMARY KEY,
    tag_nm VARCHAR(255),
    ttl_tag_ct INT
);

LOAD DATA LOCAL INFILE 'C:/Users/Aaron/Google Drive/Documents/cuny/Data607/FinalProject/new2/tags.csv' 
INTO TABLE tags
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


CREATE TABLE user_artist (
	user_id INT NOT NULL REFERENCES users(user_id),
    artist_id INT NOT NULL REFERENCES artists(artist_id),
    artist_ct INT NOT NULL
  
);

LOAD DATA LOCAL INFILE 'C:/Users/Aaron/Google Drive/Documents/cuny/Data607/FinalProject/new2/user_artist.csv' 
INTO TABLE user_artist
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



CREATE TABLE artist_tag (
	artist_id INT NOT NULL REFERENCES artists(artist_id),
    tag_id INT NOT NULL REFERENCES tags(tag_id),
    tag_ct INT NOT NULL 

);

LOAD DATA LOCAL INFILE 'C:/Users/Aaron/Google Drive/Documents/cuny/Data607/FinalProject/new2/artist_tag.csv' 
INTO TABLE artist_tag
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
 
