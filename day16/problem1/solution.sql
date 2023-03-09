with cte as    
(select *,rank() over(partition by customer_id order by customer_id,order_date) as rnk    
from delivery
)

select round(count(case when order_date = customer_pref_delivery_date then 1 end)*100/count(order_date),2) as immediate_percentage  

from cte 
where rnk =1