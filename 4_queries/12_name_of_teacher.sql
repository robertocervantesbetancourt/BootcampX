
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM assistance_requests 
JOIN teachers ON teachers.id = teacher_id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
ORDER BY teacher;