# Soal 1
# 1a
# Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

# Data sebelum dan sesudah aktivitas
orang.ke = c(seq(1:9))
 oksigen.sebelum = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
 oksigen.sesudah = c(100, 95, 70, 90, 90, 90, 89, 90, 100)
 data = data.frame(orang.ke,oksigen.sebelum, oksigen.sesudah)
 n = 9
# Standar Devisiasi sebelum dan sesudah aktivitas
selisih = data$oksigen.sesudah - data$oksigen.sebelum
 cat("Standar deviasi selisih pasangan pengamatan : ")
 standardev = sd(selisih)
 standardev

# 1b
# carilah nilai t (p-value)

# Mencari nilai t(p-value) dengan t-test
t.test(before, after, alternative = "greater", var.equal = FALSE)

# 1c
var.test(before, after)

t.test(before, after, mu = 0, alternative = "two.sided", var.equal = TRUE)


# Soal 2
install.packages("BSDA")
library(BSDA)

# Soal 2a
# Jawaban di README

# Soal 2b 
tsum.test(mean.x=23500, sd(3900), n.x=100)

# Soal 2c
# Jawaban di README

# Soal 3
# Soal 3a
# H0 dan H1
# Jawaban di README

# soal 3b 
# Hitung Sampel Statistik
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79 , s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)

# soal 3c
# soal 3d
# soal 3e
# soal 3f

# Soal 4
# Soal 4a
# Soal 4b
# Soal 4c
# Soal 4d
# Soal 4e
# Soal 4f


# Soal 5
# Soal 5a
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("C:/Users/rendi/Downloads/GTL.csv")
head(GTL)

str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)

# Soal 5b
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

# Soal 5c
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

# Soal 5d
tukey <- TukeyHSD(anova)
print(tukey)

# Soal 5e
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

