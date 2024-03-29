   
CREATE TABLE SUBJECT (
  subject_id INTEGER PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  Description JSONB
);


CREATE TABLE CLASSROOM (
  classroom_id INTEGER PRIMARY KEY,
  number SMALLINT NOT NULL,
  number_of_seats INT,
  university VARCHAR(30),
  description JSONB
);


CREATE TABLE TEACHER (
  teacher_id INTEGER PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,  
  university text[],
  function VARCHAR(30),
  review text,
  awards text[]
);    


CREATE TABLE PAIR (
  pair_id SERIAL,
  university VARCHAR(30), 
  subject_id INTEGER NOT NULL,
  name VARCHAR(30),
  teachers INTEGER NOT NULL, 
  classrooms INTEGER NOT NULL,
  groups INTEGER NOT NULL,
  time TIME NOT NULL, 
  weekday SMALLINT NOT NULL CHECK (weekday > 0 AND weekday < 8),
  year INTEGER
)PARTITION BY RANGE (year);


CREATE TABLE pair1 PARTITION OF pair
    FOR VALUES FROM (1) TO (2);	
CREATE TABLE pair2 PARTITION OF pair
    FOR VALUES FROM (2) TO (3);	
CREATE TABLE pair3 PARTITION OF pair
    FOR VALUES FROM (3) TO (4);
CREATE TABLE pair4 PARTITION OF pair
    FOR VALUES FROM (4) TO (5);
CREATE TABLE pair5 PARTITION OF pair
    FOR VALUES FROM (5) TO (6);
CREATE TABLE pair6 PARTITION OF pair
    FOR VALUES FROM (6) TO (7);
CREATE TABLE pair7 PARTITION OF pair
    FOR VALUES FROM (7) TO (8);
CREATE TABLE pair8 PARTITION OF pair
    FOR VALUES FROM (8) TO (9);


CREATE TABLE GROUPS (
  group_id INTEGER PRIMARY KEY,
  number_of_students INTEGER NOT NULL CHECK (number_of_students > 0)
);


ALTER TABLE PAIR ADD
	FOREIGN KEY (subject_id) 
	REFERENCES SUBJECT (subject_id) ON DELETE CASCADE;

ALTER TABLE PAIR ADD
	FOREIGN KEY (Teachers)
	REFERENCES TEACHER (teacher_id) ON DELETE CASCADE;

ALTER TABLE PAIR ADD
	FOREIGN KEY (classrooms)
	REFERENCES CLASSROOM (classroom_id) ON DELETE CASCADE;

ALTER TABLE PAIR ADD
	FOREIGN KEY (groups)
	REFERENCES GROUPS (group_id) ON DELETE CASCADE;
