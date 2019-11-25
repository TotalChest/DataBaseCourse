BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
	UPDATE groups SET number_of_students = number_of_students + 1 WHERE group_id = 1;
COMMIT;

