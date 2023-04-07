with cte as(
    select 
        a.customer_id,
        count(c.product_name) as n_of_items,
        sum(c.price) total_amount
    from dannys_diner.sales a
    join dannys_diner.menu c on a.product_id=c.product_id
    where order_date <(
            select 
                join_date 
            from dannys_diner.members b 
            where a.customer_id=b.customer_id
            )
    group by a.customer_id
)
select * from cte