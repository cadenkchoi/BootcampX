-- SELECT name, email, phone
-- FROM students
-- WHERE EXISTS (SELECT end_date)
-- AND github IS NULL

SELECT name, email, phone
FROM students
WHERE github IS NULL
AND end_date IS NOT NULL;