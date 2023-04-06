select a.customer_id,sum(b.price) as price
from dannys_diner.sales a
join dannys_diner.menu b on a.product_id=b.product_id
group by 1