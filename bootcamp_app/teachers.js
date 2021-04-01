const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// Refactored as a Parameterized Query
const queryString = `
  SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
  FROM teachers
  JOIN assistance_requests ON teacher_id = teachers.id
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name = $1
  GROUP BY cohort, teacher
  ORDER BY teachers.name;
`;

const cohortName = [process.argv[2]];

pool.query(queryString, cohortName)
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`);
  })
}).catch(err => console.error('query error', err.stack));

// Without refactoring as Parameterized Query
// pool.query(`SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
// FROM teachers
// JOIN assistance_requests ON teacher_id = teachers.id
// JOIN students ON students.id = student_id
// JOIN cohorts ON cohorts.id = cohort_id
// WHERE cohorts.name = '${process.argv[2]}'
// GROUP BY cohort, teacher
// ORDER BY teachers.name;`)
// .then(res => {
//   res.rows.forEach(row => {
//     console.log(`${row.cohort}: ${row.teacher}`);
//   })
// }).catch(err => console.error('query error', err.stack));

