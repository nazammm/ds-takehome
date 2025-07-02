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
),

-- Hitung nilai rata-rata RFM
avg_values AS (
  SELECT
    AVG(recency) AS avg_recency,
    AVG(frequency) AS avg_frequency,
    AVG(monetary) AS avg_monetary
  FROM rfm_data
)
SELECT * FROM avg_values;
