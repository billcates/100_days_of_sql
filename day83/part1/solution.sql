with cte as(
    select 
        *,
        row_number() over(partition by accountnumber order by transactiontime desc) rk 
    from Transaction_Table
)
select 
    accountnumber,
    transactiontime,
    transactionid,
    balance 
from cte 
where rk=1