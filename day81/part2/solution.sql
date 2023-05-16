select a.product_id,count(a.product_id) 
from order_tbl a 
group by a.product_id
having count(distinct order_day)>1