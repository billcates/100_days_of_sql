with cte as (
    select parent_id as id,count(distinct sub_id) as ct 
    from submissions 
    group by parent_id
)
select distinct b.sub_id as post_id,coalesce(a.ct,0) as number_of_comments
from submissions b 
left join cte a on a.id=b.sub_id
where b.parent_id is NULL
