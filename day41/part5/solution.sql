with cte as(
    select a.*,b.product_name
    from dannys_diner.sales a
    join dannys_diner.menu b on a.product_id=b.product_id
),
cte2 as(
    select 
        customer_id,
        product_name,
        count(order_date) as number_of_orders
    from cte
    group by 1,2
    order by 1,2
),
final as(
    select 
        *,
        rank() over(partition by customer_id order by number_of_orders desc) as rk
    from cte2
)
select * 
from final 
where rk=1