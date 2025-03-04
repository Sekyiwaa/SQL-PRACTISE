WITH cte AS
    (SELECT shipment_id,
    MIN(shipment_date) AS min_date
    FROM amazon_shipment
    GROUP BY shipment_id)
SELECT cte.shipment_id,
        weight
FROM amazon_shipment
JOIN cte ON amazon_shipment.shipment_id = cte.shipment_id
WHERE min_date = shipment_date