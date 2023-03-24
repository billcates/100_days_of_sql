with cte AS(
    select *,
    left(formula,1) as d1,
    right(formula,1) as d2,
    substring(formula,2,1) as o
    from input
)
select 
    a.*,
    case when a.o='+' then b.value+c.value
    else b.value-c.value
    end as new_value
from cte a 
join input b on a.d1=b.id
join input c on a.d2=c.id