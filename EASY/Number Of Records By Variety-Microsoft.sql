SELECT
    variety,
    COUNT(variety) as num_of_records
FROM
    iris
GROUP BY
    variety
ORDER BY 
    variety ASC