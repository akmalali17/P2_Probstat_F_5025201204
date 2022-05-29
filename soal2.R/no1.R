# Soal 1
# 1a
# Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

# Data sebelum dan sesudah aktivitas
before <- c(78, 75, 67, 77, 70, 72, 28, 74, 77)
after <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

# Standar Devisiasi sebelum dan sesudah aktivitas
sd_sebelum <- sd(before)
sd_sesudah <- sd(after)
sd_sebelum
sd_sesudah

# 1b
# carilah nilai t (p-value)

# Mencari nilai t(p-value) dengan t-test
t.test(before, after, alternative = "greater", var.equal = FALSE)

# 1c
var.test(before, after)

t.test(before, after, mu = 0, alternative = "two.sided", var.equal = TRUE)
