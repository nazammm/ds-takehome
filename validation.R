library(ResourceSelection)

# 2. Baca data hasil prediksi dari Python
data <- read.csv("data/hltest_input.csv")

# 3. Jalankan Hosmer-Lemeshow test
hl_result <- hoslem.test(data$default, data$pred_prob, g = 10)

# 4. Tampilkan hasil
print(hl_result)

# Load library
library(ggplot2)
library(dplyr)

# Baca data hasil prediksi dari Python
data <- read.csv("data/hltest_input.csv")

# Bagi ke 10 kelompok berdasarkan probabilitas prediksi
data$bin <- ntile(data$pred_prob, 10)

# Hitung rata-rata prediksi dan aktual untuk tiap kelompok
calib <- data %>%
  group_by(bin) %>%
  summarise(
    rata_prediksi = mean(pred_prob),
    rata_aktual = mean(default)
  )

# Plot kurva kalibrasi
ggplot(calib, aes(x = rata_prediksi, y = rata_aktual)) +
  geom_line(color = "blue") +
  geom_point() +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "grey") +
  labs(
    title = "Kurva Kalibrasi",
    x = "Probabilitas Prediksi",
    y = "Proporsi Default Aktual"
  ) +
  theme_minimal()

# Simpan hasil plot ke file
ggsave("notebooks/calibration_curve.png", width = 6, height = 4)
