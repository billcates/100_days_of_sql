with cte as(
    select a.*,b.product_name
    from dannys_diner.sales a
    join dannys_diner.menu b on a.product_id=b.product_id
),
cte2 as(
  select product_id,count(1) as ct
  from dannys_diner.sales
  group by 1
  order by 2 desc
  limit 1
)
select 
    customer_id,
    product_name,
    count(order_date) as number_of_occurences
from cte
where product_id=(select product_id from cte2 )
group by 1,2