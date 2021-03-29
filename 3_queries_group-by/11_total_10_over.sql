SELECT day, count(content) AS total_assignments
FROM assignments
GROUP BY day
HAVING count(content) >= 10
ORDER BY day;
