with cte as(
    select 
        to_char(created_at,'YYYY-MM') as dt,
        sum(value) as s 
    from sf_transactions
    group by 1
    order by 1
),
final as(
    select 
        dt,
        s,
        lag(s,1) over(order by dt) as prev
    from cte
)
select 
    dt,
    round((s-prev)*(100.0)/(prev),2) as pct
from final