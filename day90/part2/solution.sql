--sqlserver
with cte as(
    select char(ascii('A')) as cr
    union ALL
    select char(ascii(cr)+1) as cr
    from cte
    where cr<'K'
),
num as(
    select 1 as id
    union ALL
    select id+1
    from num
    where id<10
)
select 
    cr as row,
    string_agg(concat(cr,id),',') as seats
from cte,num 
group by cr
