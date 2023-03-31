select user_id,datediff(day,min(booking_date),max(booking_date)) as days_diff
from booking_table
group by user_id