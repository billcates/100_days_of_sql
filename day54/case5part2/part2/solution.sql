with recursive cte as(
    select 0 as n
    union 
    select n+1 from cte
    where n+1<52
)
select n 
from cte
where not exists
    (select distinct extract(week from week_date) as n
    from data_mart.clean_weekly_sales a
    where cte.n=extract(week from a.week_date)
)
order by 1