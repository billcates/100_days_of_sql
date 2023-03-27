with cte as(
    select * ,row_number() over(partition by user_id order by activity_date) rk
    from traffic 
    where activity='login'
)
select activity_date as login_date,count(user_id) as user_count
from cte
where rk=1
and '2019-06-30'-activity_date<90
group by 1
