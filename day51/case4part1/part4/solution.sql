WITH node_diff AS (
  SELECT 
    customer_id, node_id, start_date, end_date,
    end_date - start_date AS diff
  FROM data_bank.customer_nodes
  WHERE end_date != '9999-12-31'
  GROUP BY customer_id, node_id, start_date, end_date
  ORDER BY customer_id, node_id
  ),
sum_diff_cte AS (
  SELECT 
    customer_id, node_id, SUM(diff) AS sum_diff
  FROM node_diff
  GROUP BY customer_id, node_id)

SELECT 
  ROUND(AVG(sum_diff),2) AS avg_reallocation_days
FROM sum_diff_cte;