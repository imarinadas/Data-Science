library(tidyverse)
library(dslabs)

##  PRAKTIKUM DATA SCIENCE PLUG B
##  NADA SALSABILA IMARI
##  123180126

###############################################################################

## NOMOR 1
## Diketahui
    n1 <- 100
## Ditanya
    no1 <- (n1^2+n1)/2
## Jadi, jumlah dari 100 bilangan bulat positif pertama adalah
    no1

###############################################################################

## NOMOR 2
## Diketahui
    n2 <- 1000
## Ditanya
    no2 <- (n2^2+n2)/2
## Jadi, jumlah bilangan bulat positif dari 1 sampai 1000 adalah
    no2

###############################################################################

## NOMOR 3
## Diketahui
    n3 <- 1000
## Ditanya
    x3 <- seq(1,n3)
    no3 <- sum(x3)
## Jadi, karena hasil nomor 3 sama dengan hasil nomor dua, maka nilai jumlah
## bilangan bulat positif dari a sampai n bisa didapatkan dengan
## menggunakan implementasi rumus serta penggunaan fungsi seq dan sum
    
    no2
    no3

###############################################################################

## Nomor 4a
    a <- seq(1, 9, by = 2)
## fungsi seq akan membuat daftar angka dari 1 sampai 9 dengan
## jarak kenaikan urutan 2 angka
    
    no4a <- sum(a)
## Jadi, nilia jumlah angka dalam daftar adalah
    no4a
    
###############################################################################
    
## Nomor 4b
    b <- sample(seq(from = 1, to = 20), size = 1000, replace = TRUE)
## fungsi sequence akan membuat daftar angka 1 sampai 20
## kemudian fungsi sample akan mengambil 1000 angka acak dari daftar tersebut
## pembambilan sampel angka memungkinkan adanya pengulangan
    
    no4b <- sum(b)
## Jadi, nilai jumlah angka acak ke-1 hingga 1.000 adalah
    no4b

###############################################################################

## Nomor 5
## Ditanya : gunakan satu baris kode untuk menghitung log dengan
## nilai basis 10, pada akar kuadrat dari 100
    
    no5 <- log(sqrt(100),10)

## Jadi, dengan alur pengerjaan :
## fungsi akar kuadrat akan menghitung akar kuadrat dari sepuluh
## kemudian akan dihitung log hasil akar kuadrat 100 dengan basis 10,
## akan didapatkan hasil nilai dari log ditanya adalah
    
    no5
    
###############################################################################

## Nomor 6
## Diketahui : Misal nilai x = 1 sampai 10, kemudian akan dicobakan pada
## rumus-rumus yang diketahui disoal
    
    x6 <- seq(1,10)
## Ditanya : rumus mana yang akan selalu mengembalikan nilai numerik yang
## disimpan dalam variabel x?
    
    log (10 ^ x6)
    log10 (x6 ^ 10)
    log (exp (x6))
    exp (log (x6, base = 2))
## Jadi, yang akan selalu mengembalikan nilai numerik yang disimpan dalam
## variabel x adalah log (exp (x))
