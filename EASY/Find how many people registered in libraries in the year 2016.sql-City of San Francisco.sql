SELECT 
    count(*) AS total_patrons
FROM 
    library_usage
WHERE 
    year_patron_registered = 2016