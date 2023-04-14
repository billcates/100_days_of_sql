select 
    plan_id,
    count(1) as no_of_cust,
    round(count(1)*(100.0)/(select count(distinct customer_id) from foodie_fi.subscriptions where start_date<='2020-12-31'),2) as pct
from foodie_fi.subscriptions
where start_date<='2020-12-31'
group by 1