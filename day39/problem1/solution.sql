select order_id 
from ordersdetails
group by order_id
having max(quantity) > 
(select 
    avg(quantity) avg_total 
from ordersdetails 
group by order_id 
order by avg(quantity) desc 
limit 1);