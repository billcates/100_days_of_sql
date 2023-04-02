with cte as (
    select 
        a.customer_id,
        a.customer_name,
        count(b.contact_name) ct,
        sum(case when b.contact_name in (select customer_name from customers) then 1 
        else 0 end) as trusted
    from customers a 
    left join contacts b on a.customer_id=b.user_id
    group by a.customer_id,a.customer_name
)
select 
    a.invoice_id,
    b.customer_name,
    a.price,b.ct as contacts_cnt,
    b.trusted as trusted_contacts_cnt
from invoices a 
join cte b on a.user_id=b.customer_id
order by a.invoice_id