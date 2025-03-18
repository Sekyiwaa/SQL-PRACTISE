SELECT 
    employeename,
    totalpaybenefits
FROM sf_public_salaries
WHERE
    jobtitle LIKE '%METROPOLITAN TRANSIT AUTHORITY%';