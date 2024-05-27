-- DML (Data Manipulation Language) Queries

-- insert
INSERT INTO person_details VALUES (101, 'Tom', "Cruise", "1962-12-12", 1234567890);
INSERT INTO person_details(person_id, person_firstname, person_lastname, person_mobile_no) VALUES (102, "Will", "Smith", 1234512345);
INSERT INTO person_details 
VALUES 
(
    103, 
    'Janet', 
    'Jackson', 
    '1962-12-12', 
    1234567890,
    'NY'
),
(
    104, 
    'Robert', 
    'Downey', 
    '1965-04-04', 
    1212121212,
    'Atlanta'
),
(
    105, 
    'Scarlett', 
    'Johansson', 
    '1984-11-22', 
    1122334455,
    'NY'
);
-- update
UPDATE person_details SET person_mobile_no = 1231231230 WHERE person_id = 103;
UPDATE person_details SET person_city = 'Newyork';
UPDATE person_details SET person_city = 'Atlanta' WHERE person_id = 103;
UPDATE person_details SET person_dob = '1965-05-05', person_mobile_no = '1112221112' WHERE person_id = '104';

-- delete
DELETE FROM person_details WHERE person_id = 102;