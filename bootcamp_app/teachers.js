const { Pool } = require('pg');
const process = require('process');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx' 
});

const queryString = `
  SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, COUNT(assistance_requests.*) as total_assistances
  FROM assistance_requests 
  JOIN teachers ON teachers.id = teacher_id
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
  WHERE cohorts.name LIKE $1
  GROUP BY teacher, cohort
  ORDER BY teacher;
`;

const cohortName = process.argv[2];
const values = [`%${cohortName}%`];
pool.query(queryString, values)
.then( res => {
  //console.log(res.rows)
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`);
  })
})
.catch(err => console.error('query error', err.stack));