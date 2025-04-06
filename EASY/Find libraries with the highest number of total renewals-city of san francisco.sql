SELECT home_library_definition, 
       SUM(total_renewals) AS total_lib_renewals 
FROM library_usage 
GROUP BY home_library_definition 
ORDER BY total_lib_renewals DESC;