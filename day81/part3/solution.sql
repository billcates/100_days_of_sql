with cte as(
    select 
        order_day,
        product_id,
        sum(quantity*price)  as e 
    from Order_Tbl
    group by order_day,product_id
),
final as(
    select 
        *,
        row_number() over(partition by order_day order by e desc) rk
    from cte
)
select * 
from final 
where rk=1