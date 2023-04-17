with cte as(
    select 
        distinct c1.customer_id,
        extract(month from c1.txn_date) as month
    from data_bank.customer_transactions c1
    join data_bank.customer_transactions c2
    on c1.customer_id=c2.customer_id 
    and extract(month from c1.txn_date)=extract(month from c2.txn_date)
    where c1.txn_type='deposit'
    and (c2.txn_type='purchase' or c2.txn_type='withdrawal')
)
select month,count(1) as no_of_customers
from cte
group by 1