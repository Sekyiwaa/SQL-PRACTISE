SELECT  advertising_channel,
    year, 
    SUM(money_spent) / CAST(SUM(customers_acquired) AS float)
FROM uber_advertising
WHERE advertising_channel LIKE '%bus%'
GROUP BY advertising_channel,
            year;