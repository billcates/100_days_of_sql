with cte as(
    select 
        balance,
        dates,
        case when lag(balance,1) over(order by dates)=balance then 0 else 1 end as TEMP
    from balancetbl
),
final as(
    select 
        balance,
        dates,
        sum(temp) over(order by dates) as s
    from cte
)
select 
    balance,
    min(dates) as start_date,
    max(dates) as end_date
from FINAL
group by s,balance
order by s