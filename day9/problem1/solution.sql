with cte as
(
    select 
    seat_id,
    free,
    seat_id-row_number() over(order by (select NULL)) as grp
    from cinema
    where free='t'
)
select 
    seat_id 
from cte
where grp in (
    select grp 
    from cte
    group by grp 
    order by count(*) desc 
    limit 1
)