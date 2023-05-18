with RECURSIVE cte as(
select chr(ASCII('A')) as letter

union ALL

select chr(ASCII(letter)+1) as letter
from cte
where letter<>'Z'
)
select * from cte