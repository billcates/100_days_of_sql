with cte as(
    select *,
    row_number() over(
    partition by student_id order by grade desc,course_id) as rk
    from enrollments
)
select student_id,course_id,grade
from cte where rk=1