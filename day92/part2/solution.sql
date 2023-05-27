with cte as(
    select 
        studentid,
        isnull([1],0) as subject1,
        isnull([2],0) as subject2,
        isnull([3],0) as subject3,
        isnull([4],0) as subject4 
    from exam_score
    pivot(
    sum(marks) for subjectid in([1],[2],[3],[4])
    )as pvt_tbl
)
select 
    *,
    subject1+subject2+subject3+subject4 as total_marks,
    case when subject1>=40 and subject2>=40 and subject3>=40 and subject4>=40 and subject1+subject2+subject3+subject4 >=200 then 'Pass'
    else 'Fail' end as result
from cte