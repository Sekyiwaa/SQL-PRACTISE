SELECT COUNT(*) AS n_shipped
FROM shopify_orders
JOIN shopify_carriers ON carrier_id = id
WHERE LOWER(name) LIKE 'speedy express'