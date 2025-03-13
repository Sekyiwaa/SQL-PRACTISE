SELECT COUNT(user_id) AS n_employees
FROM 
    (SELECT user_id, employer, 
            LEAD(employer) OVER (PARTITION BY user_id 
                                 ORDER BY start_date ASC) AS next_employer 
     FROM linkedin_users) AS a
WHERE LOWER(employer) LIKE LOWER('microsoft') 
  AND LOWER(next_employer) LIKE LOWER('google')