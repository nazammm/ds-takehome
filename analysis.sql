WITH rfm_data AS (
  SELECT
    customer_id,
    DATEDIFF(CURDATE(), MAX(order_date)) AS recency,
    COUNT(DISTINCT order_id) AS frequency,
    SUM(payment_value) AS monetary
  FROM e_commerce_transactions
  GROUP BY customer_id
),

avg_values AS (
  SELECT
    AVG(recency) AS avg_recency,
    AVG(frequency) AS avg_frequency,
    AVG(monetary) AS avg_monetary
  FROM rfm_data
)

SELECT
  r.customer_id,
  r.recency,
  r.frequency,
  r.monetary,
  CASE
    WHEN r.recency < a.avg_recency AND r.frequency > a.avg_frequency AND r.monetary > a.avg_monetary THEN 'Elite'
    WHEN r.recency < a.avg_recency AND r.frequency > a.avg_frequency AND r.monetary <= a.avg_monetary THEN 'Loyal Low Spend'
    WHEN r.recency < a.avg_recency AND r.frequency <= a.avg_frequency AND r.monetary > a.avg_monetary THEN 'Potential'
    WHEN r.recency < a.avg_recency AND r.frequency <= a.avg_frequency AND r.monetary <= a.avg_monetary THEN 'Low Potential'
    WHEN r.recency >= a.avg_recency AND r.frequency > a.avg_frequency AND r.monetary > a.avg_monetary THEN 'Inactive Elite'
    WHEN r.recency >= a.avg_recency AND r.frequency > a.avg_frequency AND r.monetary <= a.avg_monetary THEN 'Inactive Loyal'
    ELSE 'Lost Customers'
  END AS rfm_segment
FROM rfm_data r
CROSS JOIN avg_values a;


-- Query Repeat-Purchase Bulanan

WITH customer_monthly_orders AS (
  SELECT 
    customer_id,
    DATE_FORMAT(order_date, '%Y-%m-01') AS month,
    COUNT(DISTINCT order_id) AS order_count
  FROM e_commerce_transactions
  GROUP BY customer_id, DATE_FORMAT(order_date, '%Y-%m-01')
)

SELECT
  month,
  COUNT(DISTINCT CASE WHEN order_count > 1 THEN customer_id END) AS repeat_customers,
  ROUND(
    (COUNT(DISTINCT CASE WHEN order_count > 1 THEN customer_id END) / 
    NULLIF(COUNT(DISTINCT customer_id), 0)) * 100, 
    2
  ) AS repeat_purchase_rate
FROM customer_monthly_orders
GROUP BY month
ORDER BY month;

-- EXPLAIN :
-- id | select_type | table                    | type | rows  | filtered | Extra
-- 1  | PRIMARY     | <derived2>               | ALL  | 10164 | 100.00   | Using filesort
-- 2  | DERIVED     | e_commerce_transactions  | ALL  | 10164 | 100.00   | Using filesort


