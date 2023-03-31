with cte as(
select *,rank() over(partition by user_id order by booking_date) as rk
from booking_table
)
select user_id 
from cte 
where rk=1 and line_of_business='Hotel'