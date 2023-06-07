with cate as(
    select 
        *,
        SUBSTRING(id,2,LENGTH(id))::INTEGER as rn 
    from students
),
even as(
    select * 
    from cate
    where rn%2=0
),
odd as(
    select * 
    from cate
    where rn%2!=0
)
select * 
from even