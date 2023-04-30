-- this is a template for running sql commands in a file
-- use the \i with FILENAME to run this file
-- But you can't be connected to this database when you run it'

DROP DATABASE IF EXISTS GeneralHospital_DB;

CREATE DATABASE generalhospital_db;

\c generalhospital_db;

CREATE TABLE doctors (
       id SERIAL PRIMARY KEY,
       name TEXT NOT NULL
);

CREATE TABLE clinics (
       id SERIAL PRIMARY KEY,
       name TEXT NOT NULL
);

CREATE TABLE patients (
       id SERIAL PRIMARY KEY,
       name TEXT NOT NULL 
);


CREATE TABLE diseases (
       id SERIAL PRIMARY KEY,
       disease TEXT NOT NULL
);

CREATE TABLE doctors_clinics (

       id SERIAL PRIMARY KEY,
       doctor INTEGER REFERENCES doctors ON DELETE CASCADE,
       clinic INTEGER REFERENCES clinics ON DELETE CASCADE
);


CREATE TABLE diagnosis (
       id SERIAL PRIMARY KEY,
       d_c  INTEGER REFERENCES doctors_clinics ON DELETE CASCADE,
       disease INTEGER REFERENCES diseases ON DELETE CASCADE,
       patient INTEGER REFERENCES patients ON DELETE CASCADE
);



INSERT INTO doctors (name) VALUES ( 'Alan Lipp' );
INSERT INTO doctors (name) VALUES ( 'Alan Dosick' );
INSERT INTO doctors (name) VALUES ( 'Mark Amir' );
INSERT INTO doctors (name) VALUES ( 'Vera Zablozki' );

INSERT INTO patients (name) VALUES ( 'me' );
INSERT INTO patients (name) VALUES ( 'my friend dave' );
INSERT INTO patients (name) VALUES ( 'the gouhlies' );
INSERT INTO patients (name) VALUES ( 'crazy mike' );

INSERT INTO clinics (name) VALUES ( 'Mount Sinai' );
INSERT INTO clinics (name) VALUES ( 'Long beach medical' );
INSERT INTO clinics (name) VALUES ( 'kings highway hospital' );
INSERT INTO clinics (name) VALUES ( 'lennox hill' );

INSERT INTO doctors_clinics (doctor, clinic) VALUES (1,4);
INSERT INTO doctors_clinics (doctor, clinic) VALUES (2,3);
INSERT INTO doctors_clinics (doctor, clinic) VALUES (1,1);
INSERT INTO doctors_clinics (doctor, clinic) VALUES (3,1);

INSERT INTO diseases (disease) VALUES ( 'slob' );
INSERT INTO diseases (disease) VALUES ( 'fat face' );
INSERT INTO diseases (disease) VALUES ( 'stupidity ' );
INSERT INTO diseases (disease) VALUES ( 'smelly' );


INSERT INTO diagnosis (patient, disease, d_c) VALUES (1, 2, 1);
INSERT INTO diagnosis (patient, disease, d_c) VALUES (3, 3, 2);
INSERT INTO diagnosis (patient, disease, d_c) VALUES (1, 2, 3);
INSERT INTO diagnosis (patient, disease, d_c) VALUES (4, 1, 2);
INSERT INTO diagnosis (patient, disease, d_c) VALUES (1, 2, 1);
INSERT INTO diagnosis (patient, disease, d_c) VALUES (4, 3, 4);
INSERT INTO diagnosis (patient, disease, d_c) VALUES (2, 4, 4);
