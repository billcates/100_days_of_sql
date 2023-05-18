with cte as(
    select 
        salesyear,
        sum(quantitysold) as s 
    from salestable
    group by salesyear
)
select 
    'Total Sales' as Total_sales,
    sum(case when salesyear=1998 then s end )as s_1998,
    sum(case when salesyear=1999 then s end )as s_1999,
    sum(case when salesyear=2000 then s end )as s_2000
from cte
