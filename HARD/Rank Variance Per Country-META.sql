WITH monthly_comments AS
  (SELECT u.country,
          DATE_FORMAT(c.created_at, '%Y-%m-01') AS month_start,
          SUM(c.number_of_comments) AS total_comments
   FROM fb_comments_count c
   JOIN fb_active_users u ON c.user_id = u.user_id
   WHERE c.created_at >= '2019-12-01'
     AND c.created_at < '2020-02-01'
   GROUP BY u.country,
            DATE_FORMAT(c.created_at, '%Y-%m-01')),
     december AS
  (SELECT country,
          total_comments
   FROM monthly_comments
   WHERE month_start = '2019-12-01'),
     january AS
  (SELECT country,
          total_comments
   FROM monthly_comments
   WHERE month_start = '2020-01-01'),
     december_rank AS
  (SELECT country,
          total_comments,
          DENSE_RANK() OVER (
                             ORDER BY total_comments DESC) AS dec_rank
   FROM december),
     january_rank AS
  (SELECT country,
          total_comments,
          DENSE_RANK() OVER (
                             ORDER BY total_comments DESC) AS jan_rank
   FROM january),
     rank_compare AS
  (SELECT d.country,
          d.dec_rank,
          j.jan_rank
   FROM december_rank d
   JOIN january_rank j ON d.country = j.country)
SELECT country
FROM rank_compare
WHERE dec_rank > jan_rank
ORDER BY dec_rank;