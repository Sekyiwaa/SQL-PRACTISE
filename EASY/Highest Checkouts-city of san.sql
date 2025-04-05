SELECT 
    count(*) AS n_patrons,
    total_checkouts
FROM 
    library_usage
WHERE 
    total_checkouts < 10
GROUP BY
    total_checkouts
ORDER BY
    total_checkouts DESC;