WITH ranked_films AS (
    SELECT
        actor_name,
        film_rating,
        release_date,
        ROW_NUMBER() OVER (PARTITION BY actor_name
                           ORDER BY release_date DESC) AS row_num
    FROM actor_rating_shift
),
latest AS (
    SELECT actor_name,
           film_rating AS latest_rating
    FROM ranked_films
    WHERE row_num = 1
),
previous AS (
    SELECT actor_name,
           AVG(film_rating) AS avg_rating
    FROM ranked_films
    WHERE row_num > 1
    GROUP BY actor_name
)
SELECT
    l.actor_name,
    IFNULL(p.avg_rating, l.latest_rating)           AS avg_rating,
    l.latest_rating,
    ROUND(l.latest_rating - IFNULL(p.avg_rating, l.latest_rating), 2)
                                                 AS rating_difference
FROM latest AS l
LEFT JOIN previous AS p USING (actor_name)
ORDER BY actor_name;