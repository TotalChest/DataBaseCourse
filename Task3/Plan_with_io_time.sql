
--Поиск с фильтрацией по нескольким полям
EXPLAIN ANALYZE SELECT Count(*) FROM
	Classroom
WHERE University = 'Синергия' AND number_of_seats < 300;


--Количество профессоров в МГУ с наградой Заслуженный преподаватель
EXPLAIN ANALYZE SELECT Count(*) FROM
	Teacher
WHERE 'МГУ' = ANY(University) AND function = 'Профессор' AND 'Заслуженный преподавтель' = ANY(Awards);


--Количество аудиторий в ВШЭ с компьютерами и проектором
EXPLAIN ANALYZE SELECT Count(*) FROM
	Classroom
WHERE University = 'ВШЭ' AND description ?& array['Проектор', 'Компьютеры'];


--Среднее количество студентов на одну группу в университете за последний год
EXPLAIN ANALYZE SELECT University, round(avg(number_of_students)::numeric,1) FROM
	(SELECT University, group_id, avg(number_of_students) as number_of_students FROM
		Pair
		INNER JOIN Groups ON(Groups = Group_id)
	WHERE year = 6
	GROUP BY University, group_id) as tbl1
GROUP BY University;


--Полнотекстовый поиск
EXPLAIN ANALYZE SELECT count(*) FROM Teacher
WHERE to_tsvector(review) @@ to_tsquery('Строгий');
