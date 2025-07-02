WITH rfm_data AS (
  SELECT
    customer_id,
    -- Hitung Recency (hari sejak transaksi terakhir)
    DATEDIFF(CURDATE(), MAX(order_date)) AS recency,
    -- Hitung Frequency (total pesanan)
    COUNT(DISTINCT order_id) AS frequency,
    -- Hitung Monetary (total nilai pembayaran)
    SUM(payment_value) AS monetary
  FROM e_commerce_transactions
  GROUP BY customer_id
)
SELECT * FROM rfm_data;
