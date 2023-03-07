SELECT  
    max(case when continent = 'America' then name end) as "America",
    max(case when continent = 'Asia' then name end) as "Asia",
    max(case when continent = 'Europe' then name end) as "Europe" 
from 
(select *  ,row_number() over (partition by continent order by name asc) as ID 
from student)A 
group by ID
order by id;