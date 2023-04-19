select 
    region,
    extract(month from week_date) as mth,
    sum(sales) as total_amount
from data_mart.clean_weekly_sales a
group by 1,2
order by 1,2
