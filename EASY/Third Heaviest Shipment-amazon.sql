WITH cte AS
    (SELECT shipment_id,
            SUM(weight) AS total_weight,
            DENSE_RANK() OVER(  
                                ORDER BY SUM(weight) DESC) AS rnk
    FROM amazon_shipment
    GROUP BY shipment_id)
SELECT shipment_id,
    total_weight
FROM cte
WHERE rnk = 3