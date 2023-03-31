with ctea as (
    select segment,count(user_id) as total_user_count
    from user_table
    group by segment
),
cteb as(
    select b.segment,count(distinct a.user_id) as ct
    from booking_table a 
    join user_table b on a.user_id=b.user_id 
    where datepart(month,a.booking_date)='4'
    and datepart(year,a.booking_date)='2022'
    group by b.segment
)
select a.segment,a.total_user_count,b.ct as user_who_booked_flight_in_apr2022 
from ctea a join cteb b 
on a.segment=b.segment