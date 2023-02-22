select 
t1.trade_id,
t2.trade_id,t1.trade_stock,t1.price,t2.price,abs(t1.price-t2.price)/t2.price *100.0 as pct_change
from trade_tbl t1 
join trade_tbl t2 on t1.trade_id<t2.trade_id 
and t1.trade_stock=t2.trade_stock
and datediff(second,t1.trade_timestamp,t2.trade_timestamp)<10
and abs(t1.price-t2.price)/t2.price *100.0 >10
order by t1.trade_id