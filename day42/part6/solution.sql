with cte as(
    select 
        a.*,
        c.product_name,
        row_number() over(partition by customer_id order by order_date) rk
    from dannys_diner.sales a
    join dannys_diner.menu c on a.product_id=c.product_id
    where order_date >=(
        select join_date 
        from dannys_diner.members b 
        where a.customer_id=b.customer_id)
  )
select 
    customer_id,
    product_id,
    product_name
from cte
where rk=1