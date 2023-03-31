select 
    b.segment,
    sum(case when line_of_business='Flight' then 1 end) as 'flight_bookings',
    sum(case when line_of_business='Hotel' then 1 end) as 'hotel_bookings'
from booking_table a 
join user_table b 
on a.user_id=b.user_id
where datepart(year,a.booking_date)='2022'
group by b.segment