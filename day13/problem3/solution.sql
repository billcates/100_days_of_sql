select f2.followee as "follower",count(1) as num
from follow f1 join follow f2
on f1.follower=f2.followee
group by f2.followee