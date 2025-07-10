SELECT worker_id,
    salary,
    department
FROM
    (SELECT *,
            RANK() OVER(
                            ORDER BY salary DESC) AS rnk
    FROM worker) cte
WHERE rnk < 11
ORDER BY 3 DESC
