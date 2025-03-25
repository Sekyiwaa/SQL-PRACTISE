SELECT 
    AVG(x) AS variance,
    SQRT(AVG(x)) AS std
FROM 
    (SELECT 
        main.score, 
        avgs.mean, 
        POW((main.score - avgs.mean), 2) AS x 
    FROM 
        (SELECT 
            AVG(score) AS mean 
        FROM los_angeles_restaurant_health_inspections 
        WHERE 
            score BETWEEN 90 AND 100
        ) AS avgs, 
        -- Main scores table
        los_angeles_restaurant_health_inspections main 
    WHERE 
        main.score BETWEEN 90 AND 100
    ) AS tmp