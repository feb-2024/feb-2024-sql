-- transactions
-- update account set balance = balance - 10000 where account_number = 1001;
-- update account set balance = balance + 10000 where account_number = 1050;

-- ACID properties
-- A - Atomicity
-- C - Consistent
-- I - Isolation
-- D - Durability

-- TCL queries
-- comit, rollback, savepoint

use demodb;

CREATE TABLE account (
    acc_id INT PRIMARY KEY,
    acc_type VARCHAR(20),
    balance INT
);

insert into account values(1001, 'SAVINGS', 30000);
insert into account values(1002, 'SAVINGS', 25000);
insert into account values(1003, 'CURRENT', 50000);
insert into account values(1050, 'SAVINGS', 70000);


select * from account;

-- a successful transaction with commit
start transaction; -- the transaction starts here
update account set balance = balance - 10000 where acc_id = 1002;
select * from account; --  changes seen in the table are temporary
update account set balance = balance + 10000 where acc_id = 1050;
select * from account; --  changes seen in the table are temporary
commit; --  the transaction ends here

select * from account; --  changes seen in the table are permanent

-- a failed transaction with rollback
start transaction; -- the transaction starts here
update account set balance = balance - 10000 where acc_id = 1002;
select * from account; --  changes seen in the table are temporary
rollback; -- the transaction ends here

select * from account; --  changes seen in the table are permanent, here the temporary changes are undone/reverted

-- a failed transaction with savepoint and rollback
start transaction;
-- query 1
-- query 2
-- query 3
savepoint svpt1;
-- query 4
-- query 5
savepoint svpt2;
-- query 6
rollback to svpt1;

