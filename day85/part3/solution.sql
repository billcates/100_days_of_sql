with cte as(
    select 
        a.sales_date,
        a.sales_amount,
            (select top 1 exchange_rate 
            from ExchangeRate_Table 
            where effective_start_date<=a.sales_date 
            and a.currency=source_currency
            order by effective_start_date desc 
        )
    as exchange_rate
    from Sales_Table a
)
select 
    sales_date,
    sum(sales_amount*exchange_rate) as total_sale_amount_in_usd
from cte
group by sales_date