select 
    a.name,
    sum(b.rest) as rest,
    sum(b.paid) as paid,
    sum(b.canceled) as canceled,
    sum(b.refunded) as refunded
from product a join invoice b
on a.product_id=b.product_id
group by 1
order by 1