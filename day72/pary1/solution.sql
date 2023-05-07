select 
    a.date,
    (count(*)*(1.0))
         /
         (select count(*) 
         from fb_friend_requests 
         where action='sent' 
         and date=a.date) as pct_accpt
from fb_friend_requests a
join fb_friend_requests b 
on a.user_id_sender=b.user_id_sender
and a.user_id_receiver=b.user_id_receiver
and a. action='sent'
and b.action='accepted'
group by 1;