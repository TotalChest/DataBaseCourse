BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	UPDATE groups SET number_of_students = number_of_students + 10;
	
	INSERT INTO groups VALUES (20,9);
COMMIT;


UPDATE groups SET number_of_students = number_of_students - 10; --возвращение первоначальных значений
