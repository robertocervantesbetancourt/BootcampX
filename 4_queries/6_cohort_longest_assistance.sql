SELECT cohorts.name as cohort, avg(completed_at - started_at) as avg_assitance_time
FROM assistance_requests 
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohort
ORDER BY avg_assitance_time DESC
LIMIT 1;