--Расписание на неделю для первой группы
SELECT name, last_name, first_name, classrooms, to_char(time, 'HH24:MI') as time , weekday FROM pair 
INNER JOIN subject USING(subject_id)
INNER JOIN teacher ON pair.teachers = teacher.teacher_id
WHERE Groups = 1
ORDER BY weekday ASC, time ASC;


--Все семинары седьмой группы на неделе
SELECT name, to_char(time, 'HH24:MI') as time, weekday FROM
(SELECT name, time, weekday, groups, count(*) OVER (PARTITION BY name, time, weekday,classrooms) FROM pair INNER JOIN subject USING(subject_id)
ORDER BY weekday ASC) tab
WHERE groups = 7 AND count = 1;


--Преподаватель,предмет и количество часов
SELECT last_name, first_name, name, count(*) FROM pair
INNER JOIN subject USING(subject_id)
INNER JOIN teacher ON pair.teachers = teacher.teacher_id
GROUP BY last_name, first_name, name
ORDER BY first_name ASC;


--Сделать доцентов проффесорами
UPDATE teacher SET function = 'Профессор' WHERE function = 'Доцент';


--Ошибка при нарушении ограничения-проверки
UPDATE groups SET number_of_students = number_of_students * (-1.5);


--Удалить кабинеты с количеством мест меньше 20
DELETE FROM classroom WHERE number_of_seats < 20;


--Удалить последнюю группу
DELETE FROM groups WHERE group_id = (SELECT max(group_id) from groups);


--Вствить нового преподавателя, если уже существует такой преподаватель - обновить его должность
INSERT INTO teacher (teacher_id,first_name, last_name, function) VALUES (13,'Власов','Михаил','Профессор')
ON CONFLICT (last_name,first_name) DO UPDATE SET function = 'Доцент';
