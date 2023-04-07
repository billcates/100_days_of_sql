select 
    a.customer_id,
    sum(case when b.product_name='sushi' then 2 *10 * b.price
        when a.order_date-c.join_date between 0 and 6 then 20 *b.price
    else 10 * b.price
    end) as points
from dannys_diner.sales a
join dannys_diner.menu b on a.product_id=b.product_id
join dannys_diner.members c on a.customer_id=c.customer_id
where a.order_date<='2021-01-31'
group by 1
order by 1