with cte as(
select 
transaction_id,date(day) dt,amount
from transactions
),
final as(
select *,rank() over(partition by dt order by amount desc) as rk
from cte
)
select transaction_id from final where rk=1
order by transaction_id