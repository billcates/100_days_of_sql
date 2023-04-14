select 
    count(distinct customer_id) as ct
from foodie_fi.subscriptions
where plan_id='3'
and extract(year from start_date)='2020'