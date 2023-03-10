with cte as(
    select *,
    row_number() over(partition by username order by startdate) as rk
    ,count(activity) over(partition by username) ct
    from useractivity 
)
select 
    username,
    activity,
    startdate,
    enddate
from cte where rk=2
or ct<2