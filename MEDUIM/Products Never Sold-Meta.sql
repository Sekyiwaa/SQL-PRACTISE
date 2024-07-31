select (1 - (cast(count(distinct product_category) as float)
/count(distinct category_id)))*100.0 
from online_products as p 
inner join online_orders as o on p.product_id=o.product_id
right join online_product_categories as c on p.product_category=c.category_id ;