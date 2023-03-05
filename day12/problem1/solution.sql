with cte as(
    select *,lead(num,1,999999) over(order by (select NULL)) as next1,
    lead(num,2,999999) over(order by (select NULL)) as next2,
    lag(num,1,999999) over(order by (select NULL)) as prev1,
    lag(num,2,999999) over(order by (select NULL))as prev2
    from logs
)
select distinct case when (num=next1 and num=next2)
or (num=next1 and num=prev1)
or (num=prev1 and num=prev2)
then num 
end as ConsecutiveNums
from cte
