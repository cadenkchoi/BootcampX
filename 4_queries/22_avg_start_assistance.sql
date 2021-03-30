SELECT AVG((created_at - started_at)*-1) AS average_wait_time
FROM assistance_requests;