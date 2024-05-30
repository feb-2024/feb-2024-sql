-- we have 2 categories of functions - scalar functions an aggregate functions

-- scalar functions work on individial value and produces individual output
-- aggregate functions work on a group of values and produce a single output

-- examples of scalar functions
SELECT * FROM products;
SELECT * FROM productlines;
SELECT * FROM customers;
SELECT * FROM payments;
SELECT * FROM orders;
SELECT * FROM orderdetails;
SELECT * FROM offices;
SELECT * FROM employees;

-- string scalar functions
SELECT productCode, productName, UCASE(productLine) FROM products; 
SELECT customerNumber, CONCAT(contactFirstName, ' ', contactLastName) FROM customers;
SELECT customerNumber, CONCAT(contactFirstName, ' ', contactLastName) AS contactFullName FROM customers;
SELECT customerNumber, customerName, CHAR_LENGTH(customerName) AS length FROM customers;
SELECT productCode, LEFT(productCode, 3) AS code, RIGHT(productCode, 4) AS region FROM products;
SELECT productCode, productName, SUBSTR(productName, 6, 3), TRIM(SUBSTR(productName, 6, 3)) FROM products;

-- numeric scalar functions
SELECT productCode, productName, buyPrice, ROUND(buyPrice, 0), ROUND(buyPrice, 1), FLOOR(buyPrice), CEIL(buyPrice) FROM products;
SELECT productCode, productName, buyPrice, POWER(buyPrice, 2), EXP(buyPrice) FROM products;
-- this function returns e^x, where x is the argument, and 'e' is Euler's constant, the base of the natural logarithms.
SELECT EXP(1); --   2.7182818^1

-- date scalar functions
SELECT customerNumber, paymentDate, DAY(paymentDate), DAYNAME(paymentDate), WEEK(paymentDate), WEEKOFYEAR(paymentDate), MONTH(paymentDate), MONTHNAME(paymentDate), YEAR(paymentDate) FROM payments;
SELECT customerNumber, paymentDate, DAYOFWEEK(paymentDate), DAYOFMONTH(paymentDate), DAYOFYEAR(paymentDate) FROM payments;
DESC payments;
SELECT customerNumber, paymentDate, DATEDIFF(CURRENT_DATE(), paymentDate) FROM payments;
-- how quickly were the orders shipped?
SELECT orderNumber, orderDate, shippedDate, DATEDIFF(shippedDate, orderDate) FROM orders;
-- assuming the return date is within 20 days from orderDate, dispay the return date for each order
SELECT orderNumber, orderDate, DATE_ADD(orderDate, INTERVAL 20 DAY) FROM orders;


SELECT orderNumber, orderDate, DATE_FORMAT(orderDate, '%Y') FROM orders;
SELECT orderNumber, orderDate, DATE_FORMAT(orderDate, '%D %b, %Y') FROM orders;
SELECT orderNumber, orderDate, DATE_FORMAT(orderDate, '%D %M, %y') FROM orders;

-- advanced functions
SELECT orderNumber, orderDate, comments, IFNULL(comments, 'N/A') FROM orders;

-- if the order is shipped in 2 days, display shipped early
-- if the order is shipped in 3 to 4, display shipped
-- if the order is shipped in 5 or more days, display shipped late
SELECT orderNumber, orderDate, shippedDate, DATEDIFF(shippedDate, orderDate), 
CASE
	WHEN DATEDIFF(shippedDate, orderDate) <=2 THEN 'Shipped early'
    WHEN DATEDIFF(shippedDate, orderDate) >2 && DATEDIFF(shippedDate, orderDate)<=4 THEN 'Shipped'
    WHEN DATEDIFF(shippedDate, orderDate) >4 THEN 'Shipped late'
END AS 'shipped status'
FROM orders;

-- aggregate functions
-- find the count of products
-- Sandhya
SELECT COUNT(productCode) FROM products;
-- find the total patment received
SELECT SUM(amount) FROM payments;
-- find out how many offices are there?
-- Ankit Raj 
SELECT COUNT(officeCode) FROM offices;
-- find out the average amount received
SELECT AVG(amount) FROM payments;
-- find out the average amount received in the year 2004
SELECT AVG(amount) AS average_amount_received FROM payments WHERE YEAR(paymentDate) = 2004;
