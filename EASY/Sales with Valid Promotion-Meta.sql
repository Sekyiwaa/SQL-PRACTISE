SELECT ((COUNT(p.promotion_id) / CAST(COUNT(*) AS decimal)) * 100.0) AS percentage
FROM online_orders AS s
LEFT OUTER JOIN online_promotions AS p ON s.promotion_id = p.promotion_id;