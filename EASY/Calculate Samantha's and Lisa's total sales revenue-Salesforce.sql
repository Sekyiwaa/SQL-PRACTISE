SELECT 
    SUM(sales_revenue) as total_revenue
FROM sales_performance
WHERE
    salesperson = 'Lisa' OR
    salesperson = 'Samantha'