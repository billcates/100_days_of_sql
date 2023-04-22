with cte as(
    SELECT 
        user_id,
        count(cookie_id) as ct
    FROM clique_bait.users
    group by 1
)
select 
    round(avg(ct),0) as avg_ct_cookies
from cte