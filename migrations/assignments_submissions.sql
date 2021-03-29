-- CREATE TABLE assignments (
-- id SERIAL KEY PRIMARY NOT NULL,
-- name VARCHAR(255) NOT NULL,
-- content VARCHAR(*),
-- day DATE,
-- chapter INTEGER,
-- duration INTEGER
-- )

-- CREATE TABLE assignment_submissions (
-- id SERIAL KEY PRIMARY NOT NULL,
-- assignment_id INTEGER,
-- student_id INTEGER,
-- duration INTEGER,
-- submission_date DATE
-- )

CREATE TABLE assignments (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  content TEXT,
  day INTEGER,
  chapter INTEGER,
  duration INTEGER
);

CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  duration INTEGER,
  submission_date DATE
);