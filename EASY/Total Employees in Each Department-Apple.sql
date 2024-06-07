SELECT department,
       COUNT(worker_id) AS num_of_workers
FROM worker
GROUP BY department