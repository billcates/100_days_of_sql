with cte as(
    select 
        a.transaction_id,
        a.product_id,
        b.product_name
    from transactions_walmart a
    join products_walmart B
    on a.product_id=b.product_id
)
select 
    a.product_name,
    b.product_name,
    count(*) as cnt
from cte a 
join cte b on a.transaction_id=b.transaction_id
and a.product_id<b.product_id
group by 1,2
order by 3 desc
limit 3