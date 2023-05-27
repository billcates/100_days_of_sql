with cte as(
    select 
        *,
        dense_rank()over(partition by userid order by createdat) rk 
    from transactions_amazon
)
select distinct 
    a.userid 
from cte  a 
join cte b on a.rk=1 
and b.rk=2 
and a.userid=b.userid
and b.createdat-a.createdat<7