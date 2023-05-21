select distinct
    case 
        when start_location<end_location then start_location
        when end_location<start_location then end_location
    end as start_location,
    case 
        when start_location>end_location then start_location
        when end_location>start_location then end_location
    end as end_location,
    distance
from travel_table
