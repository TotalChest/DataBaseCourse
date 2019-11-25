
--Новый пользователь
CREATE USER test PASSWORD '12345';


GRANT SELECT, INSERT, UPDATE, DELETE ON subject TO test;
REVOKE UPDATE ON subject FROM test;


GRANT SELECT (teacher_id,first_name,last_name,review),
      UPDATE (review)
      ON teacher TO test;


GRANT SELECT ON pair TO test;


GRANT SELECT ON mgtu_professors TO test;


--Групповая роль
CREATE ROLE group_role LOGIN;


GRANT UPDATE (number_of_seats) ON msu_classrooms TO group_role;


GRANT group_role TO test;



--psql task3 -U test -h localhost -p 5433
--ALTER ROLE group_role WITH PASSWORD '12345';
--ALTER TABLE table OWNER TO new_owner;
--DROP OWNED BY group_role;
--DROP ROLE group_role ;




