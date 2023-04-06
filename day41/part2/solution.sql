select 
    a.customer_id,
    count(distinct a.order_date) as no_of_days
from dannys_diner.sales a
group by 1