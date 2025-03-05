SELECT *
FROM worker
WHERE first_name NOT IN ('Vipul', 'Satish')
  AND lower(last_name) NOT LIKE '%c%';