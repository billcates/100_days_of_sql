with cte as(
    select 
        customer_id,
        max(case when plan_id='3' then start_date end) as annual_start_date,
        max(case when plan_id='0' then start_date end) as join_date
    from foodie_fi.subscriptions s1
    where exists
        (select customer_id
        from foodie_fi.subscriptions s2
        where s1.customer_id=s2.customer_id
        and plan_id='3')
    group by 1
)
select round(avg(annual_start_date-join_date),0) as date_diff 
from cte