SELECT year
FROM  uber_advertising
WHERE customers_acquired > 2000 AND
    advertising_channel	LIKE '%celebrities%'