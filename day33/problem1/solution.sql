with cte as(
    select *,rank()over(partition by product_id order by change_date desc) rk 
    from products
    where change_date<='2019-08-16'
),
cte1 as(
    select distinct product_id from products
)
select a.product_id,coalesce(b.new_price,10) as price
from cte1 a
left join cte b on a.product_id=b.product_id and b.rk=1
order by 2 desc

--accepted solution

(select product_id,new_price as price from products where (product_id,change_date) in

(select product_id,max(change_date)

from products

where change_date <='2019-08-16' group by 1))

union

(select product_id, case when new_price!=10 then 10 end from products p where '2019-08-16'<all

    (select change_date from products p1 where p.product_id=p1.product_id))

 