-- Five Categories of SQL queries
-- DDL : Data Definition Language
-- 			- any query that work on the structure of the table come under DDL
--			- create, alter, drop, truncate etc.
-- DML : Data Manipulation Language
-- 			- any query that work on the data of the table comes under DML
--			- insert, update, delete
-- DQL : Data Querying Language
--			- a query that queries the table
-- 			- select query
--			- select query has many clauses like where, group by, having, order by
-- TCL : Transaction Control Language
--			- this includes transaction related queries
--			- comit, rollback, savepoint etc.
-- DCL : Data Control Language
--			- this includes queries that grant previleges to user and also revoke those previleges
--			- grant, revoke 

show databases;

use book_management_system;

show tables;

select * from book_details;
select * from author_details;
select * from character_details;

-- MySQL Datatypes
-- CHAR(size) 				: fixed length string, size can be from 0 to 255
-- VARCHAR(size) 			: variable length string, size can be from 0 to 65535
-- BINARY(size)				: same as CHAR() but stores binary byte strings
-- VARBINARY(size)  		: same as VARCHAR() but stores binary byte strings
-- TINYBLOB					: for BLOB(Binary Large Objects). max length = 255 bytes
-- BLOB						: max length = 65,535 bytes
-- MEDIUMBLOB				: max length = 16,777,215 bytes
-- LONGBLOB					: max length = 4,294,967,295 bytes
-- TINYTEXT					: holds a string. max length = 255 characters
-- TEXT(size)				: max length = 65,535 characters
-- MEDIUMTEXT				: max length = 16,777,215 characters
-- LONGTEXT					: max length = 4,294,967,295 characters
-- ENUM(val1, val2, val3, ...) : a string object that can have only one value, chosen froma list of possible values.
-- SET(val1, val2, val3, ...)  : a string object that can have 0 or more values, chosen from a list of possible values.

