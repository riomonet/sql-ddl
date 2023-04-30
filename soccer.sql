-- this is a template for running sql commands in a file
-- use the \i with FILENAME to run this file
-- But you can't be connected to this database when you run it'

DROP DATABASE IF EXISTS soccer_db;

CREATE DATABASE soccer_db;

\c soccer_db;

CREATE TABLE teams (
       id SERIAL PRIMARY KEY,
       name TEXT NOT NULL
);

CREATE TABLE players (
       id SERIAL PRIMARY KEY,
       player TEXT NOT NULL,
);

CREATE TABLE referees (
       id SERIAL PRIMARY KEY,
       ref TEXT NOT NULL 
);


CREATE TABLE roster (
       id SERIAL PRIMARY KEY,
       team INTEGER REFERENCES teams ON DELETE CASCADE, 
       player INTEGER REFERENCES players ON DELETE CASCADE
);

CREATE TABLE games (

       id SERIAL PRIMARY KEY,
       team_1 INTEGER REFERENCES teams ON DELETE CASCADE,
       team_2 INTEGER REFERENCES teams ON DELETE CASCADE,
       referee INTEGER REFERENCES referees ON DELETE SET NULL
       dt DATETIME
);

CREATE TABLE goals (
       id SERIAL PRIMARY KEY,
       player INTEGER REFERENCES players ON DELETE CASCADE,
       game   INTEGER REFERENCES games ON DELETE CASCADE, 
       goal INTEGER DEFAULT 1		-- this is going to be 1 every time
);

