with cte as(
    select 
        *,
        row_number() over(partition by brand order by years) as rk_date,
        row_number() over(partition by brand order by amount) as rk_amount 
    from brands
),
cte2 as (
select brand 
from cte
where rk_date=rk_amount
group by brand
having count(*)=max(rk_amount)
)
select * 
from brands a
where exists(
    select brand 
    from cte2 b 
    where a.brand=b.brand)