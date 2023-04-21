with cte as(
    select 
        calendar_year,
        sum(case when week_number between 21 and 24 then sales end ) as before,
        sum(case when week_number between 25 and 28 then sales end ) as after
    from data_mart.clean_weekly_sales
    where week_number between 21 and 28
    group by calendar_year
)
select 
    *,
    before - after as change, 
    (after-before)*(100.0)/(before) as pct
from cte