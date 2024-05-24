-- DDL (Data Definition Language) Queries

-- Database related queries
CREATE DATABASE demodb;
SHOW DATABASES;
USE demodb;
DROP DATABASE demodb;

-- Table related queries
CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20),
    person_lastname VARCHAR(20),
    person_dob DATE,
    person_mobile_no INT
);

DESCRIBE person_details;
DESC person_details;

ALTER TABLE person_details ADD COLUMN person_city VARCHAR(20);
DESC person_details;

ALTER TABLE person_details MODIFY COLUMN person_city VARCHAR(30);
DESC person_details;

ALTER TABLE person_details DROP COLUMN person_city;
DESC person_details;

DROP TABLE person_details;
DESC person_details;

