with cte as
    (
    select src,dest,count(1) as no_of_routes ,sum(distance) as tot_dist
    , row_number() over(order by src) as id
    from src_dest_dist
    group by src,dest
    )
select t1.src, t1.dest
, (t1.tot_dist + t2.tot_dist)/(t1.no_of_routes + t2.no_of_routes) as avg_distance
from cte t1
join cte t2 on t1.src = t2.dest and t1.id < t2.id;
