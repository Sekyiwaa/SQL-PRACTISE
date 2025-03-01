SELECT COUNT(shipment_id), DATE_FORMAT(shipment_date, '%Y-%m') AS date_ym
FROM amazon_shipment
GROUP BY date_ym;