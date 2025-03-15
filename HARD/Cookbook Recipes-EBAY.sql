WITH t1 AS
  (SELECT *,
          (ROW_NUMBER() OVER(
                             ORDER BY page_number) - 1) AS rown
   FROM cookbook_titles)
SELECT ((ROW_NUMBER() over(
                           ORDER BY t1.page_number)-1)*2) AS left_page_number,
       t2.title AS left_title,
       t3.title AS right_title
FROM t1
LEFT JOIN t1 AS t2 ON t2.page_number = t1.rown*2
LEFT JOIN t1 AS t3 ON t3.page_number = t1.rown*2+1;

# left_page_number | left_title | right_title