with cte as(
    SELECT 
        user_id,
        a.cookie_id,
        b.visit_id,
        extract(year from b.event_time) as yr,
        extract(month from b.event_time) as mth
    FROM clique_bait.users a
    join clique_bait.events b on a.cookie_id=b.cookie_id 
)
select 
    yr,
    mth,
    count(distinct visit_id) as ct
from cte
group by 1,2