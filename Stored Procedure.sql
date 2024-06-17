-- step 1 : create the stored procedure

delimiter //
CREATE PROCEDURE demodb.add_person(id INT, firstname VARCHAR(20), lastname VARCHAR(20), dob DATE, mobile INT, city VARCHAR(20))
BEGIN
	INSERT INTO person_details VALUES (id, firstname, lastname, dob, mobile, city);
END //
delimiter ;

-- step 2 : call the stored procedure
CALL demodb.add_person(120, "NT", "Ramarao", "1960-02-02", "1111111112", "HYD");
SELECT * FROM person_details;
