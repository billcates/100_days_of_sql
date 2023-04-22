with cte as(
    SELECT 
        user_id,
        a.cookie_id,
        b.visit_id,
        b.event_type,
        extract(year from b.event_time) as yr,
        extract(month from b.event_time) as mth
    FROM clique_bait.users a
    join clique_bait.events b on a.cookie_id=b.cookie_id 
)
select round(count(distinct visit_id)*(100.0)/(select count(distinct visit_id) from cte),2) as pct
from cte
where event_type=3
