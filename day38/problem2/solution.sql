with cte as(
    select 
        account_id,
        extract(month from day) as month,
        sum(amount) as amount
    from transactions
    where type_pro='Creditor'
    group by 1,2
)
,final as(
    select 
        a.*,
        b.max_income
    from cte a 
    join accounts b on a.account_id=b.account_id
)
select 
    f1.account_id 
from final f1
join final f2
on f1.account_id=f2.account_id
and f1.month+1=f2.month
and f1.amount>f1.max_income
and f2.amount>f2.max_income