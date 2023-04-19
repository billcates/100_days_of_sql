select 
    extract(year from week_date) as n,
    count(1) as total_transactions
from data_mart.clean_weekly_sales a
group by extract(year from week_date)
order by 1
