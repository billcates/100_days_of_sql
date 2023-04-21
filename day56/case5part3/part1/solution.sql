with cte as(
    select 
        week_number,
        sales,
        case when week_date>='2020-05-15' then 'after'
        else 'before' end as base
    from data_mart.clean_weekly_sales
    where week_number between 21 and 28
),
final as( 
    select 
    sum(case when base='before' then sales end) as before
    ,sum(case when base='after' then sales end) as after
    from cte
)
select 
    *,
    before - after as change, 
    (after-before)*(100.0)/(before) as pct
from final