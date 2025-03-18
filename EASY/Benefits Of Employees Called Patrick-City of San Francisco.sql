SELECT  employeename,
    benefits
FROM sf_public_salaries
WHERE employeename LIKE '%Patrick%' AND 
    benefits IS NOT NULL;