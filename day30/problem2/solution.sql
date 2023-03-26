with recursive final as(
    select 0 as ct from cte
    union
    select ct+1 from final
    where ct<(select max(transaction_count) from (select a.user_id,a.visit_date,
            count(b.user_id) as transaction_count
            from visits a
            left join transactions b
            on a.user_id=b.user_id and a.visit_date=b.transaction_date
            group by 1,2)a)
)
,cte as(
select a.user_id,a.visit_date,
count(b.user_id) as transaction_count
from visits a
left join transactions b
on a.user_id=b.user_id and a.visit_date=b.transaction_date
group by 1,2
)
select a.ct as transactions_count,count(b.user_id) as visits_count
from final a
left join cte b on a.ct=b.transaction_count 
group by 1
order by 1