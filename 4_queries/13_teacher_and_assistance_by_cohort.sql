SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, COUNT(assistance_requests.*) as total_assistances
FROM assistance_requests 
JOIN teachers ON teachers.id = teacher_id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teacher, cohort
ORDER BY teacher;