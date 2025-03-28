SELECT profession AS department,
    SUM(CASE WHEN MONTH(birthday) = 1 THEN 1 ELSE 0 END) AS month_1,
    SUM(CASE WHEN MONTH(birthday) = 2 THEN 1 ELSE 0 END) AS month_2,
    SUM(CASE WHEN MONTH(birthday) = 3 THEN 1 ELSE 0 END) AS month_3,
    SUM(CASE WHEN MONTH(birthday) = 4 THEN 1 ELSE 0 END) AS month_4,
    SUM(CASE WHEN MONTH(birthday) = 5 THEN 1 ELSE 0 END) AS month_5,
    SUM(CASE WHEN MONTH(birthday) = 6 THEN 1 ELSE 0 END) AS month_6,
    SUM(CASE WHEN MONTH(birthday) = 7 THEN 1 ELSE 0 END) AS month_7,
    SUM(CASE WHEN MONTH(birthday) = 8 THEN 1 ELSE 0 END) AS month_8,
    SUM(CASE WHEN MONTH(birthday) = 9 THEN 1 ELSE 0 END) AS month_9,
    SUM(CASE WHEN MONTH(birthday) = 10 THEN 1 ELSE 0 END) AS month_10,
    SUM(CASE WHEN MONTH(birthday) = 11 THEN 1 ELSE 0 END) AS month_11,
    SUM(CASE WHEN MONTH(birthday) = 12 THEN 1 ELSE 0 END) AS month_12
FROM employee_list
GROUP BY profession;