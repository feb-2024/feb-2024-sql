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
-- display customerNumber, customerName, employeeNumber, employeeFullName of customers belonging to the city Melbourne
SELECT customerNumber, customerName, employeeNumber, CONCAT(firstname, ' ', lastname) AS employeeName FROM customers, employees WHERE salesRepEmployeeNumber = employeeNumber AND city = 'Melbourne';
SELECT customerNumber, customerName, employeenumber, CONCAT(firstname, ' ', lastname) AS employeeName FROM customers JOIN employees ON salesRepEmployeeNumber = employeeNumber WHERE city = 'Melbourne';

-- display order information for orders with the payment date