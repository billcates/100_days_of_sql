Create Table Transactions_Walmart (
transaction_id int,
product_id int,
users_id int,
transaction_date date
);

Insert into Transactions_Walmart values ('231574', 111, 234, '03/01/2022 12:00:00');
Insert into Transactions_Walmart values ('231574', 444, 234, '03/01/2022 12:00:00');
Insert into Transactions_Walmart values ('231574', 222, 234, '03/01/2022 12:00:00');
Insert into Transactions_Walmart values ('137124', 444, 125, '03/05/2022 12:00:00');
Insert into Transactions_Walmart values ('256234', 222, 311, '03/07/2022 12:00:00');
Insert into Transactions_Walmart values ('523152', 222, 746, '03/06/2022 12:00:00');
Insert into Transactions_Walmart values ('141415', 333, 235, '03/02/2022 12:00:00');
Insert into Transactions_Walmart values ('523152', 444, 746, '03/06/2022 12:00:00');
Insert into Transactions_Walmart values ('137124', 111, 125, '03/05/2022 12:00:00');
Insert into Transactions_Walmart values ('256234', 333, 311, '03/07/2022 12:00:00');

Create Table Products_Walmart(
product_id int,
product_name varchar(50)
);

Insert into Products_Walmart values (111,'apple');
Insert into Products_Walmart values (222,'soya milk');
Insert into Products_Walmart values (333,'instant oatmeal');
Insert into Products_Walmart values (444,'banana');
Insert into Products_Walmart values (555,'chia seed');