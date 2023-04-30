-- this is a template for running sql commands in a file
-- use the \i with FILENAME to run this file
-- But you can't be connected to this database when you run it'


DROP DATABASE IF EXISTS ari_db;

CREATE DATABASE ari_db;

\c ari_db;


CREATE TABLE table_1 (

       id SERIAL PRIMARY KEY,   --primary key just means UNIQUE NOT NULL
       other_table_ref INTEGER REFERENCES table_2(id), --default is too reference id so this is not necesssary, can put any column name in the parentheses
       amount INTEGER CHECK( amount > 10 ),
       password TEXT NOT NULL,	--must fill in this colum
       username VARCHAR(10) UNIQUE, 	--limits field to x characters and must be unique
       col_5 INT,
       col_6 BOOLEAN DEFAULT true --add default value

);

CREATE TABLE table 2 (

       id SERIAL PRIMARY KEY,
       item TEXT NOT NULL
);

INSERT INTO table_1
       ( amount, password, username)
       VALUES
       ( 109, 'xxxx', 'zblo' )




-- SELECT * FROM database where col IS NULL
-- ON DELETE SET NULL enable us to delete referenced entry row
-- ON DELETE CASCADE will delete the referencing entry row as well
