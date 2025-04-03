WITH unique_site_visits AS (
    SELECT DISTINCT *
    FROM user_streaks
    WHERE date_visited <= '2022-08-10'
),
detected_streaks AS (
    SELECT *,
        CASE
            WHEN DATEDIFF(date_visited, LAG(date_visited) OVER (PARTITION BY user_id ORDER BY date_visited)) = 1 THEN 0
            ELSE 1
        END AS streak_marker
    FROM unique_site_visits
),
streak_ids AS (
    SELECT *,
        SUM(streak_marker) OVER (PARTITION BY user_id ORDER BY date_visited) AS streak_id
    FROM detected_streaks
)
SELECT user_id, streak_length
FROM (
    SELECT user_id,
        streak_id,
        COUNT(*) + 1 AS streak_length,
        RANK() OVER (ORDER BY COUNT(*) + 1 DESC) AS rnk
    FROM streak_ids
    WHERE streak_marker = 0
    GROUP BY user_id, streak_id
) a
WHERE rnk <= 3;