with cte as(
    select 
        *,
        count(price) over(partition by stocksname order by datekey) as rk 
        from stocks
)
select 
    datekey,
    stocksname,
    price,
    min(price) over(PARTITION by stocksname,rk order by datekey) as mkt_price
from cte