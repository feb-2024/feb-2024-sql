-- we have 2 categories of functions - scalar functions an aggregate functions

-- scalar functions work on individial value and produces individual output
-- aggregate functions work on a group of values and produce a single output

-- examples of scalar functions
SELECT * FROM products;
SELECT * FROM customers;
select * from payments;
select * from orders;

-- string scalar functions
SELECT productCode, productName, UCASE(productLine) FROM products; 
SELECT customerNumber, CONCAT(contactFirstName, ' ', contactLastName) FROM customers;
SELECT customerNumber, CONCAT(contactFirstName, ' ', contactLastName) AS contactFullName FROM customers;
SELECT customerNumber, customerName, CHAR_LENGTH(customerName) AS length FROM customers;
SELECT productCode, LEFT(productCode, 3) AS code, RIGHT(productCode, 4) AS region FROM products;
SELECT productCode, productName, SUBSTR(productName, 6, 3), TRIM(SUBSTR(productName, 6, 3)) FROM products;

-- numeric scalar functions
select productCode, productName, buyPrice, ROUND(buyPrice, 0), ROUND(buyPrice, 1), FLOOR(buyPrice), CEIL(buyPrice) from products;
select productCode, productName, buyPrice, power(buyPrice, 2), exp(buyPrice)from products;
-- this function returns e^x, where x is the argument, and 'e' is Euler's constant, the base of the natural logarithms.
select exp(1); --   2.7182818^2

-- date scalar functions
select customerNumber, paymentDate, DAY(paymentDate), DAYNAME(paymentDate), WEEK(paymentDate), WEEKOFYEAR(paymentDate), (paymentDate), MONTHNAME(paymentDate), YEAR(paymentDate) from payments;
select customerNumber, paymentDate, dayofweek(paymentDate), dayofmonth(paymentDate), dayofyear(paymentDate) from payments;
desc payments;
select customerNumber, paymentDate, datediff(current_date(), paymentDate) from payments;
-- how quickly were the orders shipped?
select orderNumber, orderDate, shippedDate, datediff(shippedDate, orderDate) from orders;
-- assuming the return date is within 20 days from orderDate, dispay the return date for each order
select orderNumber, orderDate, date_add(orderDate, Interval 20 day) from orders;


select orderNumber, orderDate, date_format(orderDate, '%Y') from orders;
select orderNumber, orderDate, date_format(orderDate, '%D %b, %Y') from orders;
select orderNumber, orderDate, date_format(orderDate, '%D %M, %y') from orders;

-- advanced functions
select orderNumber, orderDate, comments, ifnull(comments, 'N/A') from orders;

-- if the order is shipped in 2 days, display shipped early
-- if the order is shipped in 3 to 4, display shipped
-- if the order is shipped in 5 or more days, display shipped late
select orderNumber, orderDate, shippedDate, datediff(shippedDate, orderDate), 
case
	when datediff(shippedDate, orderDate) <=2 then 'Shipped early'
    when datediff(shippedDate, orderDate) >2 && datediff(shippedDate, orderDate)<=4 then 'Shipped'
    when datediff(shippedDate, orderDate) >4 then 'Shipped late'
end as 'shipped status'
from orders;