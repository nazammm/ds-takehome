# DS Takehome: Credit Scoring & Customer Segmentation

Repositori ini berisi proyek analisis data untuk mengevaluasi risiko gagal bayar dan membagi pelanggan ke dalam segmen berdasarkan perilaku belanjanya.

## Struktur Folder
```
├── data/                         # Dataset mentah
│   ├── e_commerce_transactions.csv
│   └── credit_scoring.csv
├── notebooks/
│   └── B_modeling.ipynb         # Notebook Python untuk modeling
├── analysis.sql                 # Query SQL untuk segmentasi & repeat purchase
├── validation.R                 # Validasi model dengan Hosmer-Lemeshow & kalibrasi
├── A_findings.md                # Temuan awal dari EDA
├── C_summary.md                 # Cut-off skor & ringkasan akhir
└── README.md                    # Petunjuk penggunaan proyek ini
```

## Cara Menjalankan Proyek

### 1. Clone Repo
Buka terminal / CMD dan jalankan:
```
git clone https://github.com/nazammm/ds-takehome.git
cd ds-takehome
```

### 2. Buka Notebook
Jalankan file Jupyter Notebook untuk modeling:
```
jupyter notebook notebooks/B_modeling.ipynb
```

### 3. Jalankan SQL
- Import file `e_commerce_transactions.csv` ke MySQL
- Eksekusi query dari `analysis.sql`

### 4. Validasi Model di R
- Jalankan `validation.R` untuk uji HL test dan calibration curve

## Hasil Akhir
- `shap_top10.png` → Visualisasi fitur paling berpengaruh
- `calibration_curve.png` → Kalibrasi model
- `hltest_input.csv` → Input untuk validasi HL test di R
- `C_summary.md` → Cut-off score dan keputusan akhir

---
