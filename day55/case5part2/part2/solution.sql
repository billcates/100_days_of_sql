with cte as(
    SELECT 
        calendar_year,
        sum(case when demographic='Couples' then sales end) as cpl,
        sum(case when demographic='Families' then sales end) as fam
    FROM data_mart.clean_weekly_sales
    group by 1
)
select 
    calendar_year,
    round(cpl*(100.0)/(cpl+fam),2) as cpl,
    round(fam*(100.0)/(cpl+fam),2) as fam
from cte