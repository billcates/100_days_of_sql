select distinct winery 
from winemag_p1
where lower(description) similar to '%[^a-z](plum|cherry|rose|hazelnut)[^a-z]%'