BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	SELECT number_of_students FROM groups WHERE group_id = 1;
	SELECT count(*) FROM groups WHERE number_of_students < 30;
	
	SELECT number_of_students FROM groups WHERE group_id = 1; --нет неповторяемых чтений
	SELECT count(*) FROM groups WHERE number_of_students < 30; --нет фантомных чтений
	
COMMIT;


SELECT count(*) FROM groups WHERE number_of_students < 30; --изменения произошли
