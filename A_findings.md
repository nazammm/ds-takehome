## Deteksi Anomali per Kelompok Flag dengan Z-Scoe

dengan menghitung Z-score untuk mengidentifikasi anomali pada kolom `decoy_noise` ditemukan 5 transaksi dengan nilai `decoy_noise` ekstrem (berbeda dengan kelompok flagnya):

| order_id | customer_id | decoy_flag | payment_value | decoy_noise | Z-score |
|----------|-------------|------------|----------------|--------------|---------|
| 109185   | 956         | C          | 310.92         | 1468.46      | 8.65    |
| 106831   | 212         | A          | 183.09         | 1100.43      | 6.13    |
| 105703   | 439         | D          | 204.81         | 1093.35      | 6.09    |
| 105358   | 760         | C          | 263.16         | 1029.66      | 5.66    |
| 109909   | 880         | A          | 205.64         | 947.08       | 5.09    |

Anomali ini menunjukkan kemungkinan keberadaan noise sintetis pada kelompok flag tertentu, terutama dengan `decoy_flag` C dan A.
