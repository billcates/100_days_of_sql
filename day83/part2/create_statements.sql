create table SalesTable (
id int NOT NULL , 
product varchar(20), 
salesyear int, 
QuantitySold int,
primary key (ID)
);

insert into SalesTable (id,product, salesyear, QuantitySold)
values 
(1,'Laptop', 1998, 2500),
 (2,'Laptop', 1999, 3600),
(3,'Laptop', 2000, 4200),
(4,'Keyboard', 1998, 2300), 
(5,'Keyboard',1999, 4800), 
(6,'Keyboard', 2000, 5000),
(7,'Mouse', 1998, 6000), 
(8,'Mouse', 1999, 3400), 
(9,'Mouse', 2000, 4600);