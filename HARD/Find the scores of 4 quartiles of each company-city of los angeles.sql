WITH ranked_data AS
  (SELECT owner_name,
          score,
          ROW_NUMBER() OVER (PARTITION BY owner_name
                             ORDER BY score) AS row_num,
          COUNT(*) OVER (PARTITION BY owner_name) AS total_count
   FROM los_angeles_restaurant_health_inspections),
     quartile_positions AS
  (SELECT owner_name,
          FLOOR(0.25 * (total_count - 1) + 1) AS q1_pos,
          FLOOR(0.50 * (total_count - 1) + 1) AS q2_pos,
          FLOOR(0.75 * (total_count - 1) + 1) AS q3_pos,
          total_count AS q4_pos
   FROM ranked_data
   GROUP BY owner_name,
            total_count),
     quartiles AS
  (SELECT r.owner_name,
          MAX(CASE
                  WHEN r.row_num = qp.q1_pos THEN r.score
              END) AS q1,
          MAX(CASE
                  WHEN r.row_num = qp.q2_pos THEN r.score
              END) AS q2,
          MAX(CASE
                  WHEN r.row_num = qp.q3_pos THEN r.score
              END) AS q3,
          MAX(CASE
                  WHEN r.row_num = qp.q4_pos THEN r.score
              END) AS q4
   FROM ranked_data r
   JOIN quartile_positions qp ON r.owner_name = qp.owner_name
   GROUP BY r.owner_name)
SELECT owner_name,
       q1,
       q2,
       q3,
       q4
FROM quartiles
ORDER BY q1 ASC;