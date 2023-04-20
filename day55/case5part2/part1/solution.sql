with cte as(
    SELECT 
        month_number,
        sum(case when platform='Retail' then sales end) as rtl,
        sum(case when platform='Shopify' then sales end) as shpfy
    FROM data_mart.clean_weekly_sales
    group by 1
)
select 
    month_number,
    round(rtl*(100.0)/(rtl+shpfy),2) as rtl,
    round(shpfy*(100.0)/(rtl+shpfy),2) as shpfy
from cte