SELECT 
    user_id
FROM
    loans
WHERE type = 'Refinance' OR type = 'InSchool'
GROUP BY user_id
HAVING COUNT(DISTINCT type) = 2 