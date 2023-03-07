select NameCust as "Customers" 
from customers 
where id not in (
    select distinct customerid from orders
    )