with cte as(
    SELECT 
        customer_id,
        extract(month from txn_date) as mth,
        coalesce(sum(case when txn_type='deposit' then txn_amount else 0 end),0)
        -coalesce(sum(case when txn_type='purchase' then txn_amount 
        when txn_type='withdrawal' then txn_amount end),0) as bal 
    FROM data_bank.customer_transactions
    group by 1,2
)
select 
    customer_id,
    mth,
    bal as mthly_bal,
    sum(bal) over(partition by customer_id order by mth) as balance
from cte