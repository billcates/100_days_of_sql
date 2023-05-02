with cte as(
    select 
        user_id,
        created_at,
        product_id,
        rank()over(partition by user_id order by created_at ) rk
    from marketing_campaign
)
select --user_id,created_at,product_id
    count(distinct user_id)
from cte a
where rk<>1
and product_id 
    not in( 
            select 
                product_id 
            from cte b 
            where a.user_id=b.user_id 
            and rk=1
        )