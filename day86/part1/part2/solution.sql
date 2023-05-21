with recursive cte as(
    select 1 as id
    union ALL
    select id+1 as id
    from cte
    where id<20
)
select id 
from cte a
where not exists (select id 
                    from sample_table b 
                    where a.id=b.id )