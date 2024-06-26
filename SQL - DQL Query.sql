SELECT * FROM person_details;

-- select structure with its clauses

-- SELECT <projection list>
-- 		FROM <table name list>
--      WHERE <condition list>
--		GROUP BY <column name list>
-- 		HAVING <condition list>
--		ORDER BY <column name list>

SELECT * FROM customers;
SELECT * FROM orders;

-- display all customer details who belong to the city Singapore
-- Sandhya Pulicharla 
SELECT 
    *
FROM
    customers
WHERE
    city = 'Singapore';

-- display cutomerNumber, customerName and phone of customers having credit limit less than 50000
-- Sandhya Pulicharla 
SELECT 
    customerNumber, customerName, phone
FROM
    customer
WHERE
    creditLimit < 50000;

-- display customerNumber, customerName, country of customers whose name starts with 'A'
SELECT 
    customerNumber, customerName, country
FROM
    customers
WHERE
    customerName LIKE 'A%';
    
-- display cutomerNumber, customerName, phone, creditLimit of customers having credit limit between 50000 and 100000
SELECT 
    customerNumber, customerName, phone, creditLimit
FROM
    customers
WHERE
    creditLimit BETWEEN 50000 AND 100000;
    
-- display customerNumber, customerName, country of customers who belong to France, USA and Norway
-- Ankit Raj 
SELECT 
    customerName, customerNumber, country
FROM
    customers
WHERE
    country IN ('France' , 'USA', 'Norway');
    
-- Aparna Malineni
SELECT 
    customerNumber, customerName, country
FROM
    customers
WHERE
    country = 'France' OR country = 'USA' OR country = 'Norway';
    
-- display customerName, state of customer whose state is null
SELECT 
    customerName, state
FROM
    customers
WHERE
    state IS NULL;

-- display customerName, state of customer whose state is not null
SELECT 
    customerName, state
FROM
    customers
WHERE
    state IS NOT NULL;
    
-- display state and customerName of cistomer whose state is not null and in ascending order of state
SELECT 
    state, customerName
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY
	state ASC, customerName DESC;
    
-- group by and having
-- find out the average amount received
SELECT AVG(amount) FROM payments;
-- find out the average amount received in the year 2004
SELECT AVG(amount) AS average_amount_received FROM payments WHERE YEAR(paymentDate) = 2004;
-- find out the average amount receieved in each year
SELECT YEAR(paymentDate), AVG(amount) FROM payments GROUP BY YEAR(paymentDate);
-- find out the total amount receieved in each year
SELECT YEAR(paymentDate), SUM(amount) FROM payments GROUP BY YEAR(paymentDate);
-- find the average buyPrice of each productLine of the products
SELECT productLine, AVG(buyPrice) FROM products GROUP BY productLine;
-- find the average buyPrice of car productLine of the products
SELECT productLine, AVG(buyPrice) FROM products WHERE productLine LIKE '%cars%' GROUP BY productLine;
-- find the number of customers in each city
SELECT city, COUNT(customerNumber) FROM customers GROUP BY city;
-- find the number of customers in each city in the countries France, Sweden and Denmark
SELECT country, city, COUNT(customerNumber) FROM customers WHERE country IN ('France', 'Sweden', 'Denmark') GROUP BY country, city;
-- display count of employees in each job title
SELECT jobTitle, COUNT(employeeNumber) FROM employees GROUP BY jobTitle; 
-- display number of orders of each year status wise
SELECT YEAR(orderDate), status, COUNT(orderNumber) FROM orders GROUP BY YEAR(orderDate), STATUS ORDER BY YEAR(orderDate) DESC, STATUS;
-- find the average buyPrice of each productLine of the products which have average buyprice greater than 50
SELECT productLine, AVG(buyPrice) FROM products GROUP BY productLine HAVING AVG(buyPrice) > 50;
-- find the average buyPrice of car productLine of the products
SELECT productLine, AVG(buyPrice) FROM products WHERE productLine LIKE '%cars%' GROUP BY productLine; -- recommended
SELECT productLine, AVG(buyPrice) FROM products GROUP BY productLine HAVING productLine LIKE '%cars%'; -- not recommended
-- find the number of customers in each city in the countries France, Sweden and Denmark whose count is less than 2
SELECT country, city, COUNT(customerNumber) FROM customers WHERE country IN ('France', 'Sweden', 'Denmark') GROUP BY country, city HAVING COUNT(customerNumber) < 2 ORDER BY country, city;