SELECT * FROM classroom;

INSERT INTO classroom VALUES (20,113,10,6);

INSERT INTO classroom VALUES (22,113,DEFAULT,6);

INSERT INTO classroom VALUES (25,113,10,12);

UPDATE classroom SET number_of_seats = number_of_seats * 1.5;

UPDATE classroom SET computers = computers + 10;
