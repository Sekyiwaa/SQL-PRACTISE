SELECT 
    date
FROM aapl_historical_stock_price
WHERE open = 
    (SELECT 
        MAX(open) 
     FROM 
        aapl_historical_stock_price)