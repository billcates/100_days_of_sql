Create Table Staffing (
employee_id int,
is_consultant varchar(1),
job_id int);

Insert into Staffing values(111,1,7898);
Insert into Staffing values(121,0,6789);
Insert into Staffing values(111,1,9020);
Insert into Staffing values(156,1,4455);
Insert into Staffing values(111,1,8885);

Create Table Consulting_engagements(
job_id int,
client_id int,
start_dates date,
end_dates date,
contract_amount int
);


Insert into Consulting_engagements values (6789,20045,'06/01/2021 00:00:00','11/12/2021 00:00:00',33040.00);
Insert into Consulting_engagements values (8885,20022,'07/05/2021 00:00:00','07/31/2021 00:00:00',4670.00);
Insert into Consulting_engagements values (9020,20345,'08/14/2021 00:00:00','10/31/2021 00:00:00',22370.00);
Insert into Consulting_engagements values (4455,20001,'01/25/2021 00:00:00','05/31/2021 00:00:00',31839.00);
Insert into Consulting_engagements values (7898,20076,'05/25/2021 00:00:00','06/30/2021 00:00:00',11290.00);
Insert into Consulting_engagements values (3462,20099,'09/15/2021 00:00:00','11/15/2021 00:00:00',240000.00);
Insert into Consulting_engagements values (2354,20001,'10/14/2021 00:00:00','12/31/2021 00:00:00',54000.00);
