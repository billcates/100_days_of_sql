select 
    a.customer_id,
    sum(case when b.product_name='sushi' then 2 *10 * b.price
    else 10 * b.price
    end) as points
from dannys_diner.sales a
join dannys_diner.menu b on a.product_id=b.product_id
group by 1
order by 1