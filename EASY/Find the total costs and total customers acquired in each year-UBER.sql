SELECT year,
    SUM(money_spent) AS total_money_spent,
    SUM(customers_acquired) AS total_customers_acquired
FROM uber_advertising
GROUP BY year