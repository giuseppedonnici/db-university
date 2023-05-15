1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS `enrolments`, YEAR(`enrolment_date`)
FROM `students` 
GROUP BY YEAR(`enrolment_date`):

2. Contare gli insegnanti che hanno l ufficio nello stesso edificio
SELECT COUNT(*) AS `teachers_in_the_office`, `office_number`
FROM `teachers` 
GROUP BY `office_number`;

3. Calcolare la media dei voti di ogni appello d esame
SELECT AVG(`vote`), `exam_id`
FROM `exam_student`
GROUP BY `exam_id`;

4. Contare quanti corsi di laurea ci sono per ogni dipartimento