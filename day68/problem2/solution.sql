select 
    a.first_name,
    sum(b.total_order_cost) as s,b.order_date 
from customers a
join orders b on a.id=b.cust_id
group by 1,3
order by 2 desc
limit 1;