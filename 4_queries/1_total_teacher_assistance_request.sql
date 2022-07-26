SELECT teachers.name as teacher, count(assistance_requests.*) as total_assistances
FROM teachers JOIN assistance_requests ON teachers.id = teacher_id
WHERE teachers.name IN ('Waylon Boehm')
GROUP BY teacher;