1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name` AS `student_name`, `students`.`surname` AS `student_surname`, `degrees`.`name` AS `degree_name`
FROM `degrees`
JOIN `students`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT `departments`.`name` AS `department_name`, `degrees`.`name` AS `degree_name`, `degrees`.`level`
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `degrees`.`level` = "magistrale"
AND `departments`.`name`= "Dipartimento di Neuroscienze";

3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.`name` AS `course_name`, `teachers`.`name` AS `teacher_name`, `teachers`.`surname` AS `teacher_surname`
FROM `courses`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `course_teacher`.`teacher_id`= 44;

4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`surname` AS `student_surname`, `students`.`name` AS `student_name`, `students`.`enrolment_date` AS `enrolment_date`, `degrees`.`name` AS `degree_name`, `departments`.`name` AS `department_name` 
FROM `departments` 
JOIN `degrees` 
ON `departments`.`id` = `degrees`.`department_id` 
JOIN `students` 
ON `degrees`.`id` = `students`.`degree_id` 
ORDER BY `student_surname` ASC, `student_name`;

5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.`surname` AS `teacher_surname`, `teachers`.`name` AS `teacher_name`, `departments`.`name`
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `departments`.`name` = "Dipartimento di Matematica"
ORDER BY `teacher_surname` ASC

7. BONUS: Selezionare per ogni studente quanti tentativi d esame ha sostenuto per superare ciascuno dei suoi esami