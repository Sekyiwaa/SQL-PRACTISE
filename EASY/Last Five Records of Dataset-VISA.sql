SELECT *
FROM worker
WHERE worker_id > ((SELECT COUNT(*) FROM worker) - 5);