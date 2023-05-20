select 
    a.trade_id as first_trade,
    b.trade_id as second_trade,
    floor((100*abs(b.price-a.price))/a.price) as price_diff 
from trade_tbl a 
join trade_tbl b 
on a.trade_id<b.trade_id
and a.trade_stock=b.trade_stock
and extract(second from b.trade_timestamp-a.trade_timestamp)<=10
and floor((100*abs(b.price-a.price))/a.price)>10