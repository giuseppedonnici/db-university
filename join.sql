1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT *
FROM `students`
JOIN `degrees`
ON `strudents`.`degree_id` = `degrees`.`id`
WHERE WHERE `degrees`.`name` = "Corso di Laurea in Economia";

2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT *
FROM `degrees`
JOIN `departments`
ON `degrees`.`department_id` = `department`.`id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze"
AND `degrees`.`level` = "magistrale";

3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.`name` AS `course_name`, `teachers`.`name` AS `teacher_name`, `teachers`.`surname` AS `teacher_surname`
FROM `courses`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `course_teacher`.`teacher_id`= 44;


4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`surname` AS `student_surname`, `students`.`name` AS `student_name`, `degrees`.`name` AS `degree_name`, `departments`.`name` AS `department_name` 
FROM `departments` 
JOIN `degrees` 
ON `departments`.`id` = `degrees`.`department_id` 
JOIN `students` 
ON `degrees`.`id` = `students`.`degree_id` 
ORDER BY `student_surname`, `student_name`;

5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS `degree_name`, `courses`.`name` AS `courses_name`, `teachers`.`name` AS `teacher_name`, `teachers`.`surname` AS `teacher_surname` 
FROM `degrees` 
JOIN `courses` 
ON `degrees`.`id` = `courses`.`degree_id` 
JOIN `course_teacher` 
ON `courses`.`id` = `course_teacher`.`course_id` 
JOIN `teachers` 
ON `course_teacher`.`teacher_id` = `teachers`.`id` 
ORDER BY `degree_name`

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
ORDER BY `teacher_surname`

7. BONUS: Selezionare per ogni studente quanti tentativi d esame ha sostenuto per superare ciascuno dei suoi esami
SELECT `students`.`id`, `students`.`name`, `students`.`surname`, `courses`.`id`, `courses`.`name` AS `course_name`, COUNT(*) AS `attempts`, MAX(`vote`) AS `max_vote`
FROM `students`
JOIN `exam_student`
ON `students`.`id` = `exam_student`.`student_id`
JOIN `exams`
ON `exam_student`.`exam_id` = `exams`.`id`
JOIN `courses`
ON `exams`.`course_id` = `courses`.`id`
GROUP BY `students`.`id`, `courses`.`id`
HAVING `max_vote` >= 18;