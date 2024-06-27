SELECT REPLACE(first_name, ' ','') AS first_name_trim
FROM worker_ws
WHERE REPLACE(first_name, ' ','') NOT LIKE ' %'