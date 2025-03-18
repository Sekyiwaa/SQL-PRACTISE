SELECT 
    count(*)
FROM library_usage
WHERE total_renewals BETWEEN 1 AND 9 AND
    circulation_active_month = 'April' AND
    circulation_active_year = '2015';