with recursive tbl as(
    select 0 as start_date,30 as end_date 
    union all
    select start_date+30,end_date+30 from tbl 
    where end_date+30<365
)
, cte as(
    select 
        customer_id,
        max(case when plan_id='3' then start_date end) as annual_start_date,
        max(case when plan_id='0' then start_date end) as join_date
    from foodie_fi.subscriptions s1
    where exists
        (select customer_id
        from foodie_fi.subscriptions s2
        where s1.customer_id=s2.customer_id
        and plan_id='3'
    )
    group by 1
),
final_cte as(
    select 
        customer_id,
        annual_start_date-join_date as day_diff
    from cte
)
select 
    b.start_date,
    b.end_date,
    round(avg(day_diff),0) as avg_days
from final_cte a 
join tbl b on a.day_diff between b.start_date and b.end_date
group by 1,2
order by 1,2