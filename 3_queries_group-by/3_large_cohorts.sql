SELECT cohorts.name AS cohort_name, COUNT(students.*) AS students_count
FROM cohorts JOIN students ON cohorts.id = cohort_id
GROUP BY cohorts.name
HAVING COUNT(students.*) > 17
ORDER BY COUNT(students.*) ASC;