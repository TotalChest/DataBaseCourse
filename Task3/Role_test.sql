
SELECT * FROM subject;
INSERT INTO subject VALUES (20, 'Сети ЭВМ', '{"Компьютеры":"Да"}');
DELETE FROM subject WHERE subject_id = 20;


SELECT * FROM teacher; --Ошибка
SELECT teacher_id, first_name, last_name FROM teacher;
UPDATE teacher SET review = 'Строгий' WHERE teacher_id = 167;


SELECT * FROM pair LIMIT 20;


SELECT * FROM mgtu_professors;


SELECT * FROM msu_classrooms; --Ошибка
BEGIN;
UPDATE msu_classrooms SET number_of_seats = 320;
ROLLBACK;
