with recursive cte as(
    select 1 as id,'INTERVIEW' as tx,'INTERVIEW' as o
    UNION ALL
    select id+1 as id ,SUBSTRING(o,1,length(o)-id) as tx,o
    from cte
    where id<LENGTH('INTERVIEW')
)
select id,tx 
from cte