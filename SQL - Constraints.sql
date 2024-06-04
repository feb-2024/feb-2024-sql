-- contraints list
-- 1. not null
-- 2. unique
-- 3. primary key
-- 4. foreign key
-- 5. default
-- 6. check

CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20),
    person_lastname VARCHAR(20),
    person_dob DATE,
    person_mobile_no INT,
    person_city VARCHAR(30)
);

USE demodb;
SELECT * FROM person_details;
INSERT INTO person_details(person_city) VALUES ('Detroit');
DELETE FROM person_details WHERE person_city = 'Detroit';
DELETE FROM person_details WHERE person_id = 102; 
DELETE FROM person_details WHERE person_id = 101; 

-- not null constraint
-- ways to add a constraint to a column in the table
-- 1. using alter table query
ALTER TABLE demodb.person_details MODIFY COLUMN person_firstname VARCHAR(20) NOT NULL;
ALTER TABLE demodb.person_details MODIFY COLUMN person_lastname VARCHAR(20) NOT NULL;
ALTER TABLE demodb.person_details MODIFY COLUMN person_dob DATE NOT NULL;
ALTER TABLE demodb.person_details MODIFY COLUMN person_city VARCHAR(30) NOT NULL;
DESC person_details;


-- 2. specifying the constraint at the time of creating the table
CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20) NOT NULL,
    person_lastname VARCHAR(20) NOT NULL,
    person_dob DATE NOT NULL,
    person_mobile_no INT,
    person_city VARCHAR(30) NOT NULL
);

-- unique constraint
-- 1. using alter table query
ALTER TABLE person_details ADD UNIQUE(person_mobile_no);
ALTER TABLE person_details ADD CONSTRAINT UK_person_mobile UNIQUE(person_mobile_no);
INSERT INTO person_details VALUES(101, 'Tom', 'Cruise', '1962-10-10', 1234567890, 'NY'); -- error

-- 2. using create table query
-- specifying constraint at column level
CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20) NOT NULL,
    person_lastname VARCHAR(20) NOT NULL,
    person_dob DATE NOT NULL,
    person_mobile_no INT UNIQUE,
    person_city VARCHAR(30) NOT NULL
);

-- specifying constraint at table level
CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20) NOT NULL,
    person_lastname VARCHAR(20) NOT NULL,
    person_dob DATE NOT NULL,
    person_mobile_no INT,
    person_city VARCHAR(30) NOT NULL,
    UNIQUE(person_mobile_no)
);
CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20) NOT NULL,
    person_lastname VARCHAR(20) NOT NULL,
    person_dob DATE NOT NULL,
    person_mobile_no INT,
    person_city VARCHAR(30) NOT NULL,
    CONSTRAINT UK_person_mobile UNIQUE(person_mobile_no)
);

-- primary key constraint
-- 1. using alter table query
ALTER TABLE person_details ADD PRIMARY KEY(person_id);
ALTER TABLE person_details ADD CONSTRAINT PK_person_id PRIMARY KEY(person_id);

-- 2. using create table query
-- specifying constraint at column level
CREATE TABLE person_details (
    person_id INT PRIMARY KEY,
    person_firstname VARCHAR(20) NOT NULL,
    person_lastname VARCHAR(20) NOT NULL,
    person_dob DATE NOT NULL,
    person_mobile_no INT UNIQUE,
    person_city VARCHAR(30) NOT NULL
);
-- specifying constraint at table level
CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20) NOT NULL,
    person_lastname VARCHAR(20) NOT NULL,
    person_dob DATE NOT NULL,
    person_mobile_no INT UNIQUE,
    person_city VARCHAR(30) NOT NULL,
    PRIMARY KEY(person_id)
);
CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20) NOT NULL,
    person_lastname VARCHAR(20) NOT NULL,
    person_dob DATE NOT NULL,
    person_mobile_no INT UNIQUE,
    person_city VARCHAR(30) NOT NULL,
    CONSTRAINT PK_person_id PRIMARY KEY(person_id)
);

-- foreign key constraint
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(20) NOT NULL
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(40) NOT NULL,
    emp_contact VARCHAR(10),
    emp_dept_id INT,
    FOREIGN KEY(emp_dept_id) REFERENCES department(dept_id)
);

INSERT INTO department VALUES(501, 'HR');
INSERT INTO department VALUES(502, 'ADMIN');
INSERT INTO department VALUES(503, 'IT');
SELECT * FROM department;

INSERT INTO employee VALUES(101, 'abc', '1234567890', 501);
INSERT INTO employee VALUES(102, 'xyz', '888888888', 502);
INSERT INTO employee VALUES(103, 'lmn', '222222222', 503);
INSERT INTO employee VALUES(104, 'asd', '111111111', 503);
SELECT * FROM employee;
INSERT INTO employee VALUES(105, 'qwe', '99999999', 567); -- error foreign key violation

-- default constraint
-- 1. using alter table query
ALTER TABLE person_details ALTER person_city SET DEFAULT 'world';
INSERT INTO person_details(person_id, person_firstname, person_lastname, person_dob) VALUES (109, 'Jennifer', 'Lopez', '1970-03-03');
SELECT * FROM person_details;
-- 2. using create table query
CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20) NOT NULL,
    person_lastname VARCHAR(20) NOT NULL,
    person_dob DATE NOT NULL,
    person_mobile_no INT UNIQUE,
    person_city VARCHAR(30) NOT NULL DEFAULT 'world',
    CONSTRAINT PK_person_id PRIMARY KEY(person_id)
);

-- check constraint
-- 1. using alter table query
ALTER TABLE person_details ADD CHECK(person_mobile_no >= 1000000000 AND person_mobile_no <= 9999999999);
SELECT * FROM person_details;
INSERT INTO person_details(person_id, person_firstname, person_lastname, person_dob, person_mobile_no, person_city) 
	VALUES (101, 'Emma', 'Watson', '1990-03-03', 1564564564, 'Chicago'); -- no error
INSERT INTO person_details(person_id, person_firstname, person_lastname, person_dob, person_mobile_no, person_city) 
	VALUES (102, 'Rupert', 'Grint', '2001-03-03', 1564, 'Chicago'); -- error as check constraint is violated
-- 2. using create table query




-- indexes
-- primary key constraint = not null constraint + unique constraint + automatically indexed
SELECT * FROM person_details;
SELECT * FROM person_details WHERE person_city = 'NY';
DESC person_details;

CREATE INDEX idx_person_city ON person_details(person_city);

SELECT * FROM person_details WHERE person_city = 'Chicago' AND person_last_name = "Smith";

CREATE INDEX idx_person_city_person_lastname ON person_details(person_city, person_lastname);

ALTER TABLE person_details DROP INDEX idx_person_city_person_lastname;

SHOW INDEXES FROM person_details;
-- auto increment

CREATE TABLE color_details (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    color_name VARCHAR(20)
);

INSERT INTO color_details(color_name) VALUES ('RED');
INSERT INTO color_details(color_name) VALUES ('BLUE');
INSERT INTO color_details(color_name) VALUES ('GREEN');

SELECT * FROM color_details;
