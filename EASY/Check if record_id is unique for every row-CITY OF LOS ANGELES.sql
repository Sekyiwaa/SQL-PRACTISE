SELECT
    COUNT(record_id) AS c1,
    COUNT(DISTINCT record_id) AS c2
FROM
    los_angeles_restaurant_health_inspections;