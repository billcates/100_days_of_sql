select 
id,
case when id %2=0 then lag(student,1) over(order by id) 
when id %2<>0 then lead(student,1,student)  over(order by id) end as student
from seat