
--Количество студентов в ВУЗе
CREATE FUNCTION Students(x varchar) RETURNS int AS $$
	SELECT Sum(c)::int FROM 
		(SELECT avg(number_of_students) c FROM
			Pair
			INNER JOIN Groups ON (groups=group_id)
		WHERE University = $1
		GROUP BY groups) table1;
$$ LANGUAGE SQL;


--Количество мест в аудиториях для экзаменов
CREATE FUNCTION seats_for_exam(k int = 2) RETURNS TABLE(classroom_id int,number smallint,number_of_seats int,university varchar) AS $$
    SELECT classroom_id, number, number_of_seats/k, university FROM Classroom;
$$ LANGUAGE SQL;


--Основной университет преподавателя
CREATE FUNCTION main_university(IN int, OUT university text) AS $$
	SELECT tc.university[1] FROM teacher tc WHERE teacher_id = $1;
$$ LANGUAGE SQL;


--Отзыв указанных преподавателей
CREATE FUNCTION teach_review(VARIADIC arr int[], OUT teacher_id int, OUT review text) RETURNS SETOF record  AS $$
    SELECT teacher_id, review FROM teacher WHERE teacher_id = ANY(arr);
$$ LANGUAGE SQL;
