-- this is a template for running sql commands in a file
-- use the \i with FILENAME to run this file
-- But you can't be connected to this database when you run it'

DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE regions(
       id SERIAL PRIMARY KEY,
       region TEXT NOT NULL
);

CREATE TABLE categories (
       id SERIAL PRIMARY KEY,
       category TEXT NOT NULL
);

CREATE TABLE users (
       id SERIAL PRIMARY KEY,
       username TEXT NOT NULL,
       pref_region INTEGER REFERENCES regions ON DELETE SET NULL
);


CREATE TABLE posts (
       id SERIAL PRIMARY KEY,
       title TEXT NOT NULL,
       post TEXT NOT NULL,
       location TEXT NOT NULL,
       owner INTEGER REFERENCES users ON DELETE CASCADE,
       region INTEGER REFERENCES regions ON DELETE SET NULL,
       category INTEGER REFERENCES categories ON DELETE CASCADE
);



INSERT INTO regions (region) VALUES ( 'North America' );
INSERT INTO regions (region) VALUES ( 'Eastern Europe' );
INSERT INTO regions (region) VALUES ( 'South America' );
INSERT INTO regions (region) VALUES ( 'Asia' );

INSERT INTO categories (category) VALUES ( 'cars' );
INSERT INTO categories (category) VALUES ( 'boats' );
INSERT INTO categories (category) VALUES ( 'furniture' );
INSERT INTO categories (category) VALUES ( 'music equipment' );

INSERT INTO users (username, pref_region) VALUES ( 'Howie', 1 );
INSERT INTO users (username, pref_region) VALUES ( 'sara', 3 );
INSERT INTO users (username, pref_region) VALUES ( 'Marv', 2 );
INSERT INTO users (username, pref_region) VALUES ( 'Sissy', 4 );
INSERT INTO users (username, pref_region) VALUES ( 'Sly', 2 );
INSERT INTO users (username, pref_region) VALUES ( 'hung', 4 );

INSERT INTO posts (title,post,location,owner,region,category) VALUES ('nice hairdryer','for sale hair dryer for 200', 'nyc',1, 2, 1);
INSERT INTO posts (title,post,location,owner,region,category) VALUES ('cheap shoes', 'cheapest shoes known to man but super nice','tennessee',3, 3, 2);
INSERT INTO posts (title,post,location,owner,region,category) VALUES ('fast car', 'this shit flies like you woulnt believe', 'moscow',4, 3, 3);

