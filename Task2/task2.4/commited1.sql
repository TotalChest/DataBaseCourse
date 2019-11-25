BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
	SELECT number_of_students FROM groups WHERE group_id = 1;
	
	SELECT number_of_students FROM groups WHERE group_id = 1; --отсутствие грязных чтений

	SELECT number_of_students FROM groups WHERE group_id = 1; --наличие неповторяемых чтений
	
COMMIT;
