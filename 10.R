install.packages("ggplot2")
library(ggplot2)
str(airquality)
library(dplyr)
ggplot(airquality, aes(x = day, y = temp))+
  geom_point()+
  geom_text(aes(label = temp, vjust = 0, hjust = 0))
str(mtcars)
ggplot(mtcars, aes(x = wt, y = mpg))+
  geom_point()+
  annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha = 0.5, fill = "skyblue")
ggplot(mtcars, aes(x=wt, y=mpg))+
  geom_point()+
  annotate("rect", xmin=3, xmax=4, ymin=12, ymax=21, alpha=0.5, fill="skyblue")+
  annotate("segment", x=2.5, xend = 3.7, y=10, yend=17, color="brown", arrow=arrow())
ggplot(mtcars, aes(x=wt, y=mpg))+
  geom_point()+
  annotate("rect", xmin=3, xmax=4, ymin=12, ymax=21, alpha=0.5, fill="skyblue")+
  annotate("segment", x=2.5, xend=3.7, y=10, yend=17, color="red", arrow=arrow())+
  annotate("text", x=2.5, y=10, label="point")
ggplot(mtcars, aes(x=gear))+geom_bar()+
  labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수")
