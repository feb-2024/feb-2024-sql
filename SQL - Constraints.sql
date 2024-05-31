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
alter table person_details add unique(person_mobile_no);
alter table person_details add constraint UK_person_mobile unique(person_mobile_no);
insert into person_details values(101, 'Tom', 'Cruise', '1962-10-10', 1234567890, 'NY'); -- error

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
alter table person_details add primary key(person_id);
alter table person_details add constraint PK_person_id primary key(person_id);

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
    foreign key(emp_dept_id) references department(dept_id)
);

insert into department values(501, 'HR');
insert into department values(502, 'ADMIN');
insert into department values(503, 'IT');
select * from department;

insert into employee values(101, 'abc', '1234567890', 501);
insert into employee values(102, 'xyz', '888888888', 502);
insert into employee values(103, 'lmn', '222222222', 503);
insert into employee values(104, 'asd', '111111111', 503);
select * from employee;
insert into employee values(105, 'qwe', '99999999', 567); -- error foreign key violation

-- default constraint
-- 1. using alter table query
alter table person_details alter person_city set default 'world';
insert into person_details(person_id, person_firstname, person_lastname, person_dob) values (109, 'Jennifer', 'Lopez', '1970-03-03');
select * from person_details;
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