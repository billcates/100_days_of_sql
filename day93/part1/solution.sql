with recursive cte as(
    select employeeid,employeename,managerid,0 as level 
    from employee_table 
    where managerid is null

    union ALL

    select a.employeeid,A.employeename,a.managerid,mgr.level+1 
    from employee_table A
    join cte mgr on a.managerid=mgr.employeeid
)
select * from cte