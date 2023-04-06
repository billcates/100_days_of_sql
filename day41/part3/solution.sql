with cte as(
    select 
        a.customer_id,
        b.product_name,
        rank() over(
                    partition by a.customer_id 
                    order by a.order_date,b.product_name
        ) as rk
    from dannys_diner.sales a
    join dannys_diner.menu b on a.product_id=b.product_id
  )
select 
    distinct customer_id,
    product_name
from cte 
where rk=1