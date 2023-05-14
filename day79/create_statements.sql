-->> Dataset:
drop table src_dest_dist;
create table src_dest_dist
(
    src         varchar(20),
    dest        varchar(20),
    distance    float
);
insert into src_dest_distance_2 values ('A', 'B', 21);
insert into src_dest_distance_2 values ('B', 'A', 28);
insert into src_dest_distance_2 values ('A', 'B', 19);
insert into src_dest_distance_2 values ('C', 'D', 15);
insert into src_dest_distance_2 values ('C', 'D', 17);
insert into src_dest_distance_2 values ('D', 'C', 16.5);
insert into src_dest_distance_2 values ('D', 'C', 18);

select * from src_dest_dist;