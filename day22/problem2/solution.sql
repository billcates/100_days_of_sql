with recursive cte as(
    select 1 as ids 
    union all
    select ids+1 as ids 
    from cte
    where ids<(select max(customer_id) from customers)
)
select a.ids  from cte a
left join customers b
on a.ids=b.customer_id
where b.customer_id is NULL