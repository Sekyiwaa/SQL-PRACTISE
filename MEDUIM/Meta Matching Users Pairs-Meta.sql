SELECT
    e1.id AS employee_1,
    e2.id AS employee_2
FROM
    facebook_employees e1 
JOIN
    facebook_employees e2 
ON 
    e1.location = e2.location AND
    e1.age <> e2.age AND
    e1.gender = e2.gender AND
    e1.is_senior <> e2.is_senior
WHERE
    e1.id IS NOT NULL AND
    e2.id IS NOT NULL