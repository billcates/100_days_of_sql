create table clean_weekly_sales
as(
    SELECT TO_DATE(week_date, 'DD/MM/YY') AS week_date,
    DATE_PART('week', TO_DATE(week_date, 'DD/MM/YY')) AS week_number,
    DATE_PART('month', TO_DATE(week_date, 'DD/MM/YY')) AS month_number,
    DATE_PART('year', TO_DATE(week_date, 'DD/MM/YY')) AS calendar_year,
    region,platform,segment,
    case when right(segment,1)='1' then 'Young Adults'
    when right(segment,1)='2' then 'Middle Aged'
    when right(segment,1)='3' or segment='4' then 'Retirees' 
    else 'unknown 'end as age_band,
    case when left(segment,1)='C' then 'Couples'
    when left(segment,1)='F' then 'Families'
    else 'unknown' end as demographic,
    round(sales/transactions,2) as avg_transaction ,
    transactions,sales,customer_type
    FROM data_mart.weekly_sales
)