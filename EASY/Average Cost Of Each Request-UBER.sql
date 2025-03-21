SELECT request_status,
    AVG(monetary_cost) AS average_cost
FROM uber_ride_requests
GROUP BY request_status