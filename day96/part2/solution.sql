with cte as(
    select 
        from_user,
        count(*) as total_emails 
    from google_gmail_emails
    group by 1
    order by 2 desc
)
select 
    *,
    rank() over(order by total_emails desc ,from_user) activity_rk
from cte 