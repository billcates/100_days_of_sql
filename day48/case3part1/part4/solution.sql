SELECT 
    count(distinct customer_id) as customer_ct,
    round((count(distinct customer_id)) *(100.0)/
    (select count(distinct customer_id)from foodie_fi.subscriptions),1) as pct
FROM foodie_fi.subscriptions
where plan_id=4
