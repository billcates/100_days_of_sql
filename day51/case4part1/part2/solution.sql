SELECT region_id,count(distinct node_id) 
FROM data_bank.customer_nodes
group by 1;