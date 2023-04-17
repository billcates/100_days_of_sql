with cte as(
SELECT customer_id,COUNT(*) as ct,sum(txn_amount) as tot FROM data_bank.customer_transactions
where txn_type='deposit'
group by 1
)
select round(avg(ct),0) as avg_ct,
round(avg(tot),0) as avg_deposit_amt
from cte