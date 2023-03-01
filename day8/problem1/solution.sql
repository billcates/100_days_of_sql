with cte as
(
    select 
    sale_date,
    sum(
    case when fruit='apples' then sold_num
    else 0
    end 
    )as apples,
    sum(
    case when fruit='oranges' then sold_num
    else 0
    end
    ) as oranges
    from sales
    group by sale_date
    order by sale_date
)
select sale_date,apples-oranges as diff
from cte