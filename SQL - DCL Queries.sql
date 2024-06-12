
CREATE USER 'developer1 '@' localhost' IDENTIFIED BY 'dev1';

GRANT SELECT ON demodb.person_details TO developer1@localhost;

GRANT INSERT, UPDATE, DELETE ON demodb.person_details TO developer1@localhost;

GRANT ALL ON demodb TO developer1@localhost;

REVOKE CREATE, ALTER, DROP ON demodb FROM developer1@localhost;

-- privileges list - select, insert, delete, index, create, alter, drop, all, update, grant

-- time to test these priveliges, connect as developer1
