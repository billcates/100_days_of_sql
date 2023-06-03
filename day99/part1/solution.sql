with cte as(
    select * 
    from user_transactions t1
    where t1.transaction_date=(
        select max(transaction_date) 
        from user_transactions t2 
        where t1.users_id=t2.users_id)
    )
select 
    transaction_date,
    count(distinct users_id) as number_of_users,
    count(distinct product_id) as number_of_products
from cte
group by 1