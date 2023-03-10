with cte as(
    select 
    b.exam_id,
    b.score,
    rank() over(partition by b.exam_id order by b.score ) as rk_low,
    rank() over(partition by b.exam_id order by b.score desc ) as rk_high,
    a.student_name,
    a.student_id as student_id
    from student a
    left join exam b on a.student_id=b.student_id
)
select * 
from student 
where student_id 
not in (
    select student_id
    from cte where exam_id is NULL or rk_low=1 or rk_high=1
)
order by student_id
