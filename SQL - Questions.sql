-- change the city Newyork to NY for persons living in Newyork
-- Sandhya Pulicharla
UPDATE person_details SET person_city="NY" WHERE person_city='Newyork';

-- remove person's details who live in NY
-- Aparna Malineni
DELETE FROM person_details WHERE person_city = "NY";