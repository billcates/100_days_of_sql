with cte as(
    select 
        id_guest,
        sum(n_messages) as n_m 
    from airbnb_contacts
    group by 1
)
select 
    dense_rank() over(order by n_m desc) as rk,
    id_guest,
    n_m
from cte
order by 1 asc;