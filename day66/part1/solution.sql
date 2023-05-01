select 
    a.date,
    sum(case when c.paying_customer='yes' then a.downloads else 0 end) as pay,
    sum(case when c.paying_customer='no' then a.downloads else 0 end) as nopay
from ms_download_facts a
join ms_user_dimension b on a.user_id=b.user_id
left join ms_acc_dimension c on b.acc_id=c.acc_id
group by a.date
having 
    (sum(case when c.paying_customer='no' then a.downloads else 0 end)) >
    (sum(case when c.paying_customer='yes' then a.downloads else 0 end))
order by date;