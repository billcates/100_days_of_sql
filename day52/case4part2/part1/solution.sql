SELECT 
    txn_type,
    COUNT(*) as no_of_trans,
    sum(txn_amount) as total_amount 
FROM data_bank.customer_transactions
group by txn_type;