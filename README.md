# P2_Probstat_F_5025201204
Praktikum Probstat 2
Moh Akmal Ali Dzikri
5025201204

(Estimasi Parameter, Uji Hipotesis, dan ANOVA)


Soal
### 1. Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap
kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel
sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat
kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut
diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali
kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden
mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴

![170801862-fb8feada-e470-4bdd-90c8-2b1b050563ca](https://user-images.githubusercontent.com/103355300/170873509-9719ef27-eaab-430e-9762-efbf10776652.jpg)

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari
responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah
melakukan aktivitas 𝐴 sebanyak 70.

#### 1.a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

Langkah pertama penyelesaian adalah memasukkan semua data yang ada pada tabel pada sebuah variabel sebagai berikut

```
 orang.ke = c(seq(1:9))
 oksigen.sebelum = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
 oksigen.sesudah = c(100, 95, 70, 90, 90, 90, 89, 90, 100)
 data = data.frame(orang.ke,oksigen.sebelum, oksigen.sesudah)
 n = 9
```  
Selanjutnya mencari standar deviasinya. Standar deviasi sebelum dan sesudah aktivitas adalah

```
 selisih = data$oksigen.sesudah - data$oksigen.sebelum
 cat("Standar deviasi selisih pasangan pengamatan : ")
 standardev = sd(selisih)
 standardev
```
dengan hasil di screenshot 1.a

#### 1.b. Carilah nilai t (p-value) Untuk mencari nilai t (p-value) dapat menggunakan fungsi t.test yaitu sebagai berikut
Mencari nilai t(p-value) dengan t-test
```
 t.test(before, after, alternative = "greater", var.equal = FALSE)
```
dengan hasil di screenshot 1.b
#### 1.c. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistikadalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

Langkah pertama yaitu melihat hasil komparasi dua variabel berikut
```
var.test(before, after)

```
dengan hasil di screenshot 1.c

Lalu Selanjutnya, untuk melihat pengaruh jika tingkat signifikasi 5% dan tidak ada pengaruh yang signifikan secara statistika, maka adalah sebagai berikut
```
t.test(before, after, mu = 0, alternative = "two.sided", var.equal = TRUE)
```
dengan hasil di screenshot 1.c 2

### 2. Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan 2 library seperti referensi pada modul).

#### 2.a Apakah Anda setuju dengan klaim tersebut?

Setuju

#### 2.b Jelaskan maksud dari output yang dihasilkan!

Diketahui n = 100, Rata-Rata (X̄) = 23500, dan standar deviasi(σ) = 3900 Hasil Output:
<img width="454" alt="2 b" src="https://user-images.githubusercontent.com/103355300/170875126-1b91a1dc-6e71-476f-abaf-6d0605011b4c.png">

Maka null hipotesis yaitu :
```
H0 : μ = 20000
```
Alternatif hipotesisnya yaitu :
```
H1 : μ < 20000
```
```
z = 8.9744, p-value < 2.2e-16
```
#### 2.c Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
Kesimpulannnya adalah Nilai-P kira-kira 0, jadi menolak hipotesis nol dan menyimpulkan bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun

#### 3. a H0 dan H1 dilakukan perhitungan H0 sebagai berikut
![image](https://user-images.githubusercontent.com/103355300/170875499-250572e2-3030-433c-960e-caa32abf242c.png)

lalu dilakukan perhitungan H1 sebagai berikut
![image](https://user-images.githubusercontent.com/103355300/170875528-4e9e345e-afc2-4cb6-bf96-fbb9b83a0347.png)

#### 3. b Hitung Sampel Statistik Penghitungan dilakukan sebagai berikut
```
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, mean.y =2.79 , s.y = 1.32, n.y = 27, alternative = "greater", var.equal = TRUE)
```
![image](https://user-images.githubusercontent.com/103355300/170875585-4c499344-57dd-42ca-9368-7fde7cc9cc23.png)

#### 3. c 
#### 3. d
#### 3. e
#### 3. f

### 4. 
### 5. Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut:

#### 5.a Buatlah plot sederhana untuk visualisasi data
Run semua library yang diperlukan
```
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)
```
Selanjutnya membaca file GTL.csv dari documents
```
GTL <- read_csv("C:/Users/rendi/Downloads/GTL.csv")
head(GTL)
```
![image](https://user-images.githubusercontent.com/103355300/170875737-2b6fec42-0f87-425b-8bf0-1ec2b7c854fc.png)

Lakukan observasi pada data
```
str(GTL)
```
![image](https://user-images.githubusercontent.com/103355300/170875767-81b958a3-e1d7-42dc-9697-236c6376d3ca.png)

Selanjutnya lakukan visualisasi menggunakan simple plot yaitu sebagai berikut
```
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)
  ```
 ![image](https://user-images.githubusercontent.com/103355300/170875797-b4dbd0b7-c3aa-4279-a315-44d5bf769fc7.png)

#### 5.b Langkah pertama adalah membuat variabel as factor sebagai ANOVA
```
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
```
![image](https://user-images.githubusercontent.com/103355300/170875842-4e1198d1-3bb3-4879-8778-da24c93f87eb.png)

Selanjutnya melakukan analisis of variance (aov) yaitu sebagai berikut
```
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```

![image](https://user-images.githubusercontent.com/103355300/170875873-3a2ad5b6-bbbf-429a-91e0-e5c434a3e053.png)

#### 5.c Menggunakan group_by lalu melakukan summarise sesuai mean dan standar deviasi yang berlaku sehingga scriptnya adalah sebagai berikut

```
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```
![image](https://user-images.githubusercontent.com/103355300/170875906-6a48d71d-968d-49be-8d66-be16e9612fb5.png)

#### 5.d Lakukan uji Tukey
Menggunakan fungsi TukeyHSD sebagai berikut

```
tukey <- TukeyHSD(anova)
print(tukey)
```
![image](https://user-images.githubusercontent.com/103355300/170875983-a8d5bbad-5e4d-487a-bfb3-66fab53833da.png)
![image](https://user-images.githubusercontent.com/103355300/170875997-47541078-63dd-418f-b60f-e5ed916d849f.png)

#### 5. e Awalnya yaitu membuat compact letter display sebagai berikut
```
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
```









