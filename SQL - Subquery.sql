-- SUBQUERY IN WHERE CONDITION
-- -----------------------------
USE classicmodels;
SELECT * FROM products;
-- display productCode, productName and buyPrice
SELECT productCode, productName, buyPrice FROM products;
-- display productCode, productName and buyPrice where buyPrice < 30
SELECT productCode, productName, buyPrice FROM products WHERE buyPrice < 30;
-- display the average buyPrice of all the products
SELECT AVG(buyPrice) FROM products;
-- display productCode, productName and buyPrice where buyPrice < average buyPrice
SELECT productCode, productName, buyPrice FROM products WHERE buyPrice < (SELECT AVG(buyPrice) FROM products);

SELECT * FROM offices;
SELECT * FROM employees;
-- display the employeeNumber and employeeName of employees working in the offices in USA
SELECT officeCode FROM offices WHERE country = 'USA';
SELECT 
    employeeNumber, CONCAT(firstName, ' ', lastName)
FROM
    employees
WHERE
    officeCode IN (SELECT 
            officeCode
        FROM
            offices
        WHERE
            country = 'USA');
            
SELECT 
  employees.employeeNumber AS employeeID, 
  CONCAT(firstName, ' ',lastName) AS employeeName
FROM 
  employees
JOIN 
  offices ON employees.officeCode = offices.officeCode
WHERE 
  offices.country = 'USA';
  
-- display customerNumber and customerName of customers who have never placed an order

SELECT DISTINCT customerNumber FROM orders;
SELECT customerNumber, customerName FROM customers WHERE customerNumber NOT IN (SELECT DISTINCT customerNumber FROM orders);

-- display offices which dont have any employees
SELECT * FROM offices;
INSERT  INTO offices(officeCode,city,phone,addressLine1,addressLine2,state,country,postalCode,territory) VALUES 
('8','Chennai','+91 567 234 2347','Test','Test','TN','India','600600','NA');
SELECT DISTINCT officeCode FROM employees;
SELECT officeCode, city, state FROM offices WHERE officeCode NOT IN (SELECT DISTINCT officeCode FROM employees);
-- Emaaz Khot
SELECT officeCode, state
FROM offices
WHERE NOT EXISTS (
    SELECT 1
    FROM employees
    WHERE employees.officeCode= offices.officeCode);
    
-- display info of products which have never been order
SELECT DISTINCT productCode FROM orderdetails;
SELECT productCode FROM products;
SELECT productCode, productName, productLine FROM products WHERE productCode NOT IN (SELECT DISTINCT productCode FROM orderdetails);

-- display customer info of customer who has made the highest amount in payment
SELECT MAX(amount) FROM payments;
    
SELECT customerNumber, customerName, country FROM customers WHERE customerNumber = 
						(SELECT customerNumber FROM payment WHERE amount = 
							(SELECT MAX(amount) FROM payments));

-- display employee info of employees who have not attended any customer
SELECT DISTINCT salesRepEmployeeNumber FROM customers WHERE salesRepEmployeeNumber IS NOT NULL;
SELECT employeeNumber FROM employees;
SELECT employeeNumber, CONCAT(firstName, ' ', lastName) FROM employees WHERE employeeNumber NOT IN (SELECT DISTINCT salesRepEmployeeNumber FROM customers WHERE salesRepEmployeeNumber IS NOT NULL);

-- SUBQUERY IN FROM CLAUSE
-- ------------------------
-- display the order with maximum items and minimum items
SELECT orderNumber, COUNT(productCode) AS items FROM orderdetails GROUP BY orderNumber;
SELECT MAX(items), MIN(items) FROM (SELECT orderNumber, COUNT(productCode) AS items FROM orderdetails GROUP BY orderNumber) AS countitems;

-- CORRELATED SUBQUERY
-- --------------------
-- display productCode, productName and buyPrice where buyPrice < average buyPrice
SELECT productCode, productName, buyPrice FROM products WHERE buyPrice < (SELECT AVG(buyPrice) FROM products);

-- display productCode, productName and buyPrice of products whose buyPrices are greater than the average buyPrice of all products in each productLine
SELECT productCode, productName, buyPrice FROM products p1 WHERE buyPrice > (SELECT AVG(buyPrice) FROM products p2 WHERE p2.productLine = p1.productLine);

SELECT AVG(buyPrice) FROM products p2 WHERE p2.productLine = p1.productLine; -- inner query/ sub query is not independent, hence error
SELECT * FROM products;
SELECT AVG(buyPrice) FROM products WHERE productLine = 'Classic Cars';

-- display customers info for customers whose creditLImit is more than the average credit limit of customers in that city 
SELECT * FROM customers;
SELECT customerNumber, customerName, city FROM customers c1 WHERE creditLimit > (SELECT AVG(creditLimit) FROM customers c2 WHERE c2.city = c1.city);

-- display orderNumber, orderDate, customerNumber from orders which has price of a product less than 40
SELECT orderNumber, orderDate, customerNumber FROM orders o WHERE EXISTS (SELECT productCode FROM orderdetails od WHERE od.orderNumber = o.orderNumber AND priceEach < 40);
SELECT orderNumber, orderDate, customerNumber FROM orders o WHERE EXISTS (SELECT 5 FROM orderdetails od WHERE od.orderNumber = o.orderNumber AND priceEach < 40);

SELECT 5, productCode FROM orderdetails od WHERE priceEach < 40;
SELECT * FROM orders;
SELECT * FROM orderdetails;