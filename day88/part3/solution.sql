select studentname,English,Maths,Science 
from StudentInfo_1
pivot
(
sum(marks) for subjects in (English,Maths,Science)
)as pivot_tbl