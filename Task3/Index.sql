BEGIN;

CREATE INDEX idx_classroom ON classroom (university,number_of_seats);

CREATE INDEX idx_classroom_json ON Classroom USING GIN (description);

CREATE INDEX idx_teacher_array_awards ON teacher USING GIN (awards);

CREATE INDEX idx_teacher_function ON teacher (function)
	WHERE function = 'Профессор';

SET enable_partition_pruning = on;
--SET enable_seqscan = off;
CREATE INDEX ON pair (year);

CREATE INDEX idx_text ON teacher USING GIN (to_tsvector('russian',review));

ANALYZE;


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
WHERE to_tsvector('russian',review) @@ to_tsquery('Строгий');


ROLLBACK;
