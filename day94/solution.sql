select 
    *,
    round(((english+maths+science+geography+history+sanskrit)- 
    least(english,maths,science,geography,history,sanskrit))*(100.0)/(500),2) as pct
from ssc_exam