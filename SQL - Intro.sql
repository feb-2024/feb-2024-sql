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

-- string datatypes

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

-- numeric datatypes
-- BIT(size)	A bit-value type. The number of bits per value is specified in size. The size parameter can hold a value from 1 to 64. The default value for size is 1.
-- TINYINT(size)	A very small integer. Signed range is from -128 to 127. Unsigned range is from 0 to 255. The size parameter specifies the maximum display width (which is 255)
-- BOOL	Zero is considered as false, nonzero values are considered as true.
-- BOOLEAN	Equal to BOOL
-- SMALLINT(size)	A small integer. Signed range is from -32768 to 32767. Unsigned range is from 0 to 65535. The size parameter specifies the maximum display width (which is 255)
-- MEDIUMINT(size)	A medium integer. Signed range is from -8388608 to 8388607. Unsigned range is from 0 to 16777215. The size parameter specifies the maximum display width (which is 255)
-- INT(size)	A medium integer. Signed range is from -2147483648 to 2147483647. Unsigned range is from 0 to 4294967295. The size parameter specifies the maximum display width (which is 255)
-- INTEGER(size)	Equal to INT(size)
-- BIGINT(size)	A large integer. Signed range is from -9223372036854775808 to 9223372036854775807. Unsigned range is from 0 to 18446744073709551615. The size parameter specifies the maximum display width (which is 255)
-- FLOAT(size, d)	A floating point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter. This syntax is deprecated in MySQL 8.0.17, and it will be removed in future MySQL versions
-- FLOAT(p)	A floating point number. MySQL uses the p value to determine whether to use FLOAT or DOUBLE for the resulting data type. If p is from 0 to 24, the data type becomes FLOAT(). If p is from 25 to 53, the data type becomes DOUBLE()
-- DOUBLE(size, d)	A normal-size floating point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter
-- DOUBLE PRECISION(size, d)	 
-- DECIMAL(size, d)	An exact fixed-point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter. The maximum number for size is 65. The maximum number for d is 30. The default value for size is 10. The default value for d is 0.
-- DEC(size, d)	Equal to DECIMAL(size,d)
-- Note: All the numeric data types may have an extra option: UNSIGNED or ZEROFILL. If you add the UNSIGNED option, MySQL disallows negative values for the column. If you add the ZEROFILL option, MySQL automatically also adds the UNSIGNED attribute to the column.

-- Date and Time Data Types
-- DATE	A date. Format: YYYY-MM-DD. The supported range is from '1000-01-01' to '9999-12-31'
-- DATETIME(fsp)	A date and time combination. Format: YYYY-MM-DD hh:mm:ss. The supported range is from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'. Adding DEFAULT and ON UPDATE in the column definition to get automatic initialization and updating to the current date and time
-- TIMESTAMP(fsp)	A timestamp. TIMESTAMP values are stored as the number of seconds since the Unix epoch ('1970-01-01 00:00:00' UTC). Format: YYYY-MM-DD hh:mm:ss. The supported range is from '1970-01-01 00:00:01' UTC to '2038-01-09 03:14:07' UTC. Automatic initialization and updating to the current date and time can be specified using DEFAULT CURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP in the column definition
-- TIME(fsp)	A time. Format: hh:mm:ss. The supported range is from '-838:59:59' to '838:59:59'
-- YEAR	A year in four-digit format. Values allowed in four-digit format: 1901 to 2155, and 0000.
-- MySQL 8.0 does not support year in two-digit format.

-- mysql scalar functions