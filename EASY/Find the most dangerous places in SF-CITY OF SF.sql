SELECT
    address,
    pd_district,
    count(category) AS n_occurences
FROM sf_crime_incidents_2014_01
GROUP BY 
    address, 
    pd_district
ORDER BY
    n_occurences DESC