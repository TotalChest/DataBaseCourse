
--Профессора в МГТУ
CREATE OR REPLACE VIEW mgtu_professors AS
	SELECT *
	FROM Teacher
	WHERE function = 'Профессор' AND 'МГТУ' = ANY(University)
	WITH LOCAL CHECK OPTION;


--Аудитории МГУ с большим количеством мест
CREATE OR REPLACE VIEW msu_classrooms AS
	SELECT *
	FROM Classroom
	WHERE number_of_seats > 300 AND University = 'МГУ';


--Последние пары в пятницу в ВШЭ
CREATE MATERIALIZED VIEW last_hse_friday AS
	SELECT *
	FROM pair
	WHERE weekday = 5 AND time = '16:20' AND university = 'ВШЭ';

REFRESH MATERIALIZED VIEW last_hse_friday;

--Преподаватели и количество групп в которых они преподают
CREATE MATERIALIZED VIEW teacher_with_groups AS
	SELECT DISTINCT teacher_id, first_name, last_name, count(DISTINCT group_id) as groups FROM 
		Pairй
		INNER JOIN Teacher ON (teachers = teacher_id)
		INNER JOIN Groups ON (Pair.Groups = Groups.group_id)
	GROUP BY teacher_id, last_name, first_name;

REFRESH MATERIALIZED VIEW teacher_with_groups;
