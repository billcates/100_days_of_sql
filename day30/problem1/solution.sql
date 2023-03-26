with cte as (
select 'succeeded' as period_state, success_date as event_date
from succeeded
where extract('year' from success_date) = '2019'

union all

select 'failed' as period_state, fail_date
from failed
where extract('year' from fail_date) = '2019'

),

cte1 as (
select *,
lag(period_state,1,period_state)over(order by event_date asc) as previous_period_state
from cte
)

select period_state,
min(event_date) as start_date,
max(event_date) as end_date
from (
    select period_state, event_date,
    sum(case when period_state = previous_period_state then 0 else 1 end)over(order by event_date asc) as group_key
    from cte1
) a
group by period_state, group_key