with cte as(
    select *,
    lead(login) over(partition by account_id order by login) as next_login
    from loginfo
)
select account_id
from cte 
where logout>=next_login
