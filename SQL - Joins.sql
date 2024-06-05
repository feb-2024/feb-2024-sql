USE demodb;
SELECT * FROM department;
SELECT * FROM employee;

-- display employee id, emp name, dept name of all the employees
-- old style of writing joins (Theta style)
SELECT emp_id, emp_name, dept_name FROM employee, department WHERE emp_dept_id = dept_id;

-- new style of writing joins (using JOIN keyword)
SELECT emp_id, emp_name, dept_name FROM employee JOIN department ON emp_dept_id = dept_id;

USE classicmodels;

SELECT * FROM employees;
SELECT * FROM customers;

-- A(2,4,6)  B(1,5)
-- A X B = (2,1)(2,5)(4,1)(4,5)(6,1)(6,5)

-- some examples on inner join

-- display customerNumber, customerName, employeeNumber, employeeFullName of customers belonging to the city Melbourne
SELECT customerNumber, customerName, employeeNumber, CONCAT(firstname, ' ', lastname) AS employeeName FROM customers, employees WHERE salesRepEmployeeNumber = employeeNumber AND city = 'Melbourne';
SELECT customerNumber, customerName, employeenumber, CONCAT(firstname, ' ', lastname) AS employeeName FROM customers JOIN employees ON salesRepEmployeeNumber = employeeNumber WHERE city = 'Melbourne';

-- display order information for orders with the payment date

-- display order details of all the orders
SELECT * FROM orders;
SELECT * FROM orderdetails;
SELECT orders.orderNumber, orderDate, status, productCode, quantityOrdered FROM orders JOIN orderdetails ON orderdetails.orderNumber = orders.orderNumber;

-- display order number, orderDate and number of products in each order
SELECT 
    orders.orderNumber, orderDate, COUNT(productCode)
FROM
    orders
        JOIN
    orderdetails ON orderdetails.orderNumber = orders.orderNumber
GROUP BY orders.orderNumber;

-- display the number of payments done by each customer and display customerNumber and customerName
SELECT 
    customers.customerNumber,
    customers.customerName,
    COUNT(payments.customerNumber)
FROM
    customers
        JOIN
    payments ON customers.customerNumber = payments.customerNumber
GROUP BY customers.customerNumber;

SELECT 
    c.customerNumber,
    c.customerName,
    COUNT(p.customerNumber)
FROM
    customers c
        JOIN
    payments p ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber;

-- display employee information of employees in each office
-- Ankit Raj
SELECT employees.employeeNumber, employees.lastName, employees.firstName, employees.extension, employees.email, employees.officeCode, offices.city, offices.country
FROM employees
JOIN offices 
ON employees.officeCode = offices.officeCode;

-- display the number of employees working in each office to  Everyone
SELECT employees.employeeNumber, employees.lastName, employees.firstName, employees.extension, employees.email, employees.officeCode, offices.city, offices.country
FROM employees
JOIN offices 
ON employees.officeCode = offices.officeCode;

-- display the number of employees working in each office
SELECT offices.officeCode, offices.city, COUNT(employees.employeeNumber) AS numberOfEmployees
FROM offices
JOIN employees 
ON offices.officeCode = employees.officeCode
GROUP BY offices.officeCode, offices.city;

-- display the number of customers handled by each employee
SELECT employees.employeeNumber, employees.lastName, employees.firstName, COUNT(customers.customerNumber) AS numberOfCustomers
FROM employees
JOIN customers 
ON employees.employeeNumber = customers.salesRepEmployeeNumber
GROUP BY employees.employeeNumber, employees.lastName, employees.firstName;

SELECT employees.employeeNumber, employees.lastName, employees.firstName, COUNT(customers.customerNumber) AS numberOfCustomers
FROM employees
LEFT JOIN customers 
ON employees.employeeNumber = customers.salesRepEmployeeNumber
GROUP BY employees.employeeNumber, employees.lastName, employees.firstName;

-- display employee details of employees who have not handled any customer

SELECT employees.employeeNumber, employees.lastName, employees.firstName, COUNT(customers.customerNumber) AS numberOfCustomers
FROM employees
LEFT JOIN customers 
ON employees.employeeNumber = customers.salesRepEmployeeNumber
GROUP BY employees.employeeNumber, employees.lastName, employees.firstName
having COUNT(customers.customerNumber) = 0;

-- types of joins
-- A = {1,2,3,4,5}
-- B = {3,4,5,6,7,8}
-- inner join
--		A intersection B = {3,4,5}
-- left join
--		A - B = {1,2,3,4,5}
-- right join
-- 		B - A = {3,4,5,6,7,8}
-- self join
-- cross join


-- display customer information of customers along with order information
SELECT 
    c.customerNumber, c.customerName, o.orderNumber, o.orderDate
FROM
    customers c
        INNER JOIN
    orders o ON c.customerNumber = o.customerNumber
ORDER BY c.customerNumber;

select count(customerNumber) from customers;
SELECT 
    count(distinct customerNumber)
FROM orders;

-- some examples on left join and right join

use demodb;
select * from employee;
select * from department;

-- display dept info and emp info
select d.dept_id, d.dept_name, e.emp_id, e.emp_name from department d inner join employee e on d.dept_id = e. emp_dept_id;

select d.dept_id, d.dept_name, e.emp_id, e.emp_name from department d left join employee e on d.dept_id = e. emp_dept_id;

select d.dept_id, d.dept_name, e.emp_id, e.emp_name from department d right join employee e on d.dept_id = e. emp_dept_id;

-- some examples on self join

-- display employee id, employee name, manager(report to) id and manager(report to) name of all the employees
use classicmodels;
select * from employees;

SELECT 
    e1.employeeNumber,
    CONCAT(e1.firstName, ' ', e1.lastName) AS employeeFullName,
    e2.employeeNumber AS managerNumber,
    CONCAT(e2.firstName, ' ', e2.lastName) AS managerFullname
FROM
    employees e1
        JOIN
    employees e2 ON e1.reportsTo = e2.employeeNumber;
    
SELECT 
    e1.employeeNumber,
    CONCAT(e1.firstName, ' ', e1.lastName) AS employeeFullName,
    e2.employeeNumber AS managerNumber,
    CONCAT(e2.firstName, ' ', e2.lastName) AS managerFullname
FROM
    employees e1
		LEFT JOIN
    employees e2 ON e1.reportsTo = e2.employeeNumber;
    
SELECT 
    e1.employeeNumber,
    CONCAT(e1.firstName, ' ', e1.lastName) AS employeeFullName,
    e2.employeeNumber AS managerNumber,
    CONCAT(e2.firstName, ' ', e2.lastName) AS managerFullname
FROM
    employees e1
		RIGHT JOIN
    employees e2 ON e1.reportsTo = e2.employeeNumber;

-- some examples on cross join

use demodb;
-- old style of writing joins (Theta style)
SELECT emp_id, emp_name, dept_name FROM employee, department;

-- new style of writing joins (using JOIN keyword)
SELECT emp_id, emp_name, dept_name FROM employee CROSS JOIN department;