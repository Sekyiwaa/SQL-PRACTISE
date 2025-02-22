SELECT *
FROM worker
WHERE worker_id % 2 = 0
AND MONTH(joining_date) = 6