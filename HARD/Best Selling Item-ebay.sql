with cte as (
select date_format(invoicedate,'%m') as "month1",
        description,
        sum(quantity*unitprice) "total_paid",
        dense_rank() over (partition by date_format(invoicedate,'%m') order by sum(quantity*unitprice) desc ) as "rnk"
from online_retail
group by 1,2
order by 1,2)
select month1 as "month", description, total_paid
from cte
where rnk = 1;