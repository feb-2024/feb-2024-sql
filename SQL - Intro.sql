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
