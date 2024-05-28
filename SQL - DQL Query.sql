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