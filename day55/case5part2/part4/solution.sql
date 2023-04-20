with cte as(
    SELECT 
        calendar_year,
        avg(case when platform='Retail' then avg_transaction end) as rtl,
        avg(case when platform='Shopify' then avg_transaction end) as spfy
    FROM data_mart.clean_weekly_sales
    group by 1
)
select 
    calendar_year,
    round(rtl*(100.0)/(rtl+spfy),2) as rtl,
    round(spfy*(100.0)/(rtl+spfy),2) as spfy
from cte