SELECT
    CASE 
        WHEN n_seniors > n_usa_based
        THEN 'More seniors'
        ELSE 'More USA-based'
    END AS winner
FROM
    (SELECT
        SUM(CASE WHEN is_senior THEN 1 ELSE 0 END) AS n_seniors
    FROM
        facebook_employees) seniors
LEFT JOIN
    (SELECT
        COUNT(*) AS n_usa_based
    FROM
        facebook_employees
    WHERE
        location = 'USA'
    ) us_based
ON TRUE