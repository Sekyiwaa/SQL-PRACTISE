WITH country_points AS 
(
    SELECT country, 
           SUM(points) as total_points
    FROM winemag_p1
    GROUP BY country
),

country_rank AS 
(
    SELECT country,
           total_points,
           RANK() OVER (ORDER BY total_points DESC) as rk
    FROM country_points
)

SELECT *
FROM winemag_p2
WHERE country IN (
                    SELECT country
                    FROM country_rank
                    WHERE rk = 1
                    
                )