WITH cte AS
    (SELECT shipment_id,
            SUM(weight) AS total_weight
    FROM amazon_shipment
    GROUP BY shipment_id)
SELECT amazon_shipment.*,
        total_weight
FROM amazon_shipment
JOIN cte ON amazon_shipment.shipment_id = cte.shipment_id