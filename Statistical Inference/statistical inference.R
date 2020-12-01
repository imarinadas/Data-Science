library(ggplot2)
library(ggpubr)

data = read.csv("~/Documents/Data Science - F/tugas/Data Diabetes.csv", sep = ",", header = TRUE)
head(data) #Melihat data teratas
tail(data) #Melihat data terbawah

plot(x = data$BloodPressure, y = data$Glucose, pch = 19, cex = 0.8, frame = FALSE, xlab = "Tekanan darah", ylab = "Kadar Gula")
boxplot(Age ~ keterangan, data = data, ylab = "Umur", frame = FALSE, col = "lightgray")

library(lattice)
xyplot(
  Glucose ~ BloodPressure, group = keterangan, data=data, auto.key = TRUE, pch = 19, cex = 0.5
)
xyplot( Glucose ~ BloodPressure | keterangan, layout = c(3,1), group = keterangan, data = data, type = c("p", "smooth"), scale = "free")

library(ggplot2)
ggplot(data, aes(x = Glucose, y = BloodPressure))+
  geom_point()
ggplot(data, aes(x = Glucose, y = BloodPressure))+
  geom_point(size = 1.2, color = "steelblue", shape = 21)
ggpubr::show_point_shapes()
ggplot(data, aes(x = Glucose, y = BloodPressure))+
  geom_point(aes(color = keterangan, shape = keterangan))
ggplot(data, aes(x = Glucose, y = BloodPressure))+
  geom_point(aes(color = keterangan, shape = keterangan))+
  scale_color_manual(values = c("yellow", "green"))
ggplot(data, aes(x = Glucose, y = BloodPressure)) + geom_point(aes(color=keterangan)) + geom_smooth(aes(color=keterangan, fill = keterangan))+
  facet_wrap(~keterangan, ncol = 2, nrow = 1)+ scale_color_manual(values = c("brown", "blue"))+ scale_fill_manual(values = c("brown", "blue"))
## `geom_smooth()` using method = 'loess'

library(ggpubr)
ggdensity(data, x = "Glucose", add = "mean", rug = TRUE, color = "keterangan", fill = "keterangan", palette = "jco")
my_comparison = list(c("Diabetes", "Tidak Diabetes"))
ggboxplot(data, x= "keterangan", y="Glucose", color = "keterangan", palette = c("#00AFBB", "#E7B800"), add = "jitter")+
  stat_compare_means(comparisons = my_comparison, method = "t.test")
