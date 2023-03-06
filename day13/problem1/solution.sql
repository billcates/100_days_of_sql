with cte as(
    select a.dept_name,coalesce(b.ct,0) as student_number
    from department a left join(
    select dept_id,count(1) as ct
    from student
    group by dept_id) b
    on a.dept_id=b.dept_id
)
select * from cte order by student_number desc,dept_name