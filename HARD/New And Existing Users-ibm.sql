WITH all_users AS (
    SELECT MONTH(time_id) AS month,
           count(DISTINCT user_id) as all_users
    FROM fact_events
    GROUP BY month),
new_users AS (
    SELECT MONTH(new_user_start_date) AS month,
           count(DISTINCT user_id) as new_users
    FROM
         (SELECT user_id,
           MIN(time_id) as new_user_start_date
          FROM fact_events
          GROUP BY user_id) sq
    GROUP BY month
)
SELECT
  au.month,
  new_users / CAST(all_users AS DECIMAL) as share_new_users,
  1- (new_users / CAST(all_users AS DECIMAL)) as share_existing_users
FROM all_users au
JOIN new_users nu ON nu.month = au.month