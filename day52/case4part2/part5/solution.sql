with cte as(
    SELECT 
        customer_id,
        extract(month from txn_date) as mth,
        coalesce(sum(case when txn_type='deposit' then txn_amount else 0 end),0)
        -coalesce(sum(case when txn_type='purchase' then txn_amount 
        when txn_type='withdrawal' then txn_amount end),0) as bal 
    FROM data_bank.customer_transactions
    group by 1,2
),
fl as(
select 
    customer_id,
    mth,
    bal as mthly_bal,
    row_number() over(partition by customer_id order by mth) as rn,
    row_number() over(partition by customer_id order by mth desc) as rn_d,
    sum(bal) over(partition by customer_id order by mth) as balance
from cte
),
finl as(
select customer_id,
    sum(case when rn=1 then mthly_bal end) as st_bal,
    sum(case when rn_d=1 then balance end) as end_bal,
    (sum(case when rn_d=1 then balance end))*(100.0)/
    (sum(case when rn=1 then mthly_bal end)) as pct
from fl
group by 1
)
select 
    round(count(distinct customer_id)*(100.0)/(select count(distinct customer_id) 
    from data_bank.customer_transactions),2) as pt
from finl
where pct>=5