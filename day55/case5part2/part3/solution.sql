with cte as(
    SELECT 
        age_band,
        demographic,
        sum(sales) as amt
    FROM data_mart.clean_weekly_sales
    where platform='Retail'
    group by 1,2
)
select * 
from cte
order by amt desc
limit 1
