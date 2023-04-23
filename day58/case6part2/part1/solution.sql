with cte as(
    SELECT 
        visit_id,
        max(case when event_type in (1) and page_id =12 then 1 else 0 end) as page_view,
        max(case when event_type in (3) then 1 else 0 end) as purchase
    FROM clique_bait.events
    group by 1
)
select 
    ROUND(100 * (1-(SUM(purchase)::numeric/SUM(page_view))),2) as pct 
from cte
