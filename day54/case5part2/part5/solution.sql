select 
    platform,
    sum(transactions) as total_transaction_count
from data_mart.clean_weekly_sales a
group by 1
order by 1
