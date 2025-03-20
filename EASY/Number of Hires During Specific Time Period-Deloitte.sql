SELECT COUNT(id) AS hired_emp
FROM employees
WHERE YEAR(joining_date) = 2022
  AND MONTH(joining_date) BETWEEN 1 AND 7