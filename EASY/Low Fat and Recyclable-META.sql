select (SUM(CASE WHEN is_low_fat ='Y' AND is_recyclable ='Y' THEN 1 ELSE 0 END)/COUNT(*)*100.0) AS p 
  from facebook_products; 
