SELECT department ,COUNT(worker_id) AS n_workers
FROM worker
WHERE MONTH(joining_date) >= 4
GROUP BY department
ORDER BY n_workers DESC