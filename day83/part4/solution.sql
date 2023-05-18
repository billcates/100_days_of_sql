select 
    *,
    sum(quantity) over(partition by productcode order by inventorydate) as s 
from inventory