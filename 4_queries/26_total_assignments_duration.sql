SELECT assignments.day AS day, count(assignments.id) AS number_of_assignments, sum(duration) AS duration
FROM assignments
GROUP BY day
ORDER BY day;