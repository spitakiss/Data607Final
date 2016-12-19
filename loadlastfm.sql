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
    ttl_ct INT NOT NULL
 );
 
CREATE TABLE artists (
	artist_id INT PRIMARY KEY,
    artist_nm VARCHAR(507) NOT NULL,
    mbid CHAR(36)
);

CREATE TABLE tags (
	tag_id INT PRIMARY KEY,
    tag_nm VARCHAR(255)
);


CREATE TABLE user_artist (
	user_id INT NOT NULL REFERENCES users(user_id),
    artist_id INT NOT NULL REFERENCES artists(artist_id),
    artist_ct INT NOT NULL
  
);

CREATE TABLE artist_tag (
	artist_id INT NOT NULL REFERENCES artists(artist_id),
    tag_id INT NOT NULL REFERENCES tags(tag_id),
    tag_ct INT NOT NULL 

);
	
 # change directory as needed
LOAD DATA INFILE 'C:/Users/Aaron/Google Drive/Documents/cuny/Data607/FinalProject/new/users.csv' 
#LOAD DATA INFILE 'D:/Learn/data607/final/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
   
 

 
