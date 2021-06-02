20%/%7
20%%7
100%/%9
100%%9
2**9
5>3

x <- 1:3
y <- 3:1
"x가0보다크다" <- c(x>0)
"y가1보다크다" <- c(y>1)
"AND연산" <- c((x>0)&(y>1))
"OR연산" <- c((x>0)|(y>1))
data = data.frame(x, y,x가0보다크다,y가1보다크다,AND연산,OR연산)
data
View(data)

ID <- c(1:10)
SEX <- c("F","M","F","M","M","F","F","F","M","F")
AGE <- c(50, 40, 28, 50, 27, 23, 56, 47, 20, 38)
AREA <- c("서울","경기","제주","서울","서울","서울","경기","서울","인천","경기")
AMT17 <- c(1300000,450000,275000,400000,845000,42900,150000,570000,930000,520000)
Y17_CNT <- c(50,25,10,8,30,1,2,10,4,17)
AMT16 <- c(100000,700000,50000,125000,760000,300000,130000,400000,250000,550000)
Y16_CNT <- c(40,30,5,3,28,6,2,7,2,16)
table <- data.frame(ID, SEX, AGE, AREA, AMT17, Y17_CNT, AMT16, Y16_CNT)
table
View(table)
write.table(table, file="C:/Rstudy/Sample1.txt")
a = read.table("C:/Rstudy/Sample1.txt")
View(a)

install.packages("readxl")
library(readxl)
install.packages("writexl")
library(writexl)

write_xlsx(table, path="C:/Rstudy/Sample1.xlsx")


install.packages('formattable')
library(formattable)
ID <- c(1,2,3,4,5,6,7,8,9,10)
SEX <- c("F","M","F","M","M","F","F","F","M","F")
AGE <- c(50, 40, 28, 50, 27, 23, 56, 47, 20, 38)
AREA <- c("서울","경기","제주","서울","서울","서울","경기","서울","인천","경기")
AMT17 <- comma(c(1300000,450000,275000,400000,845000,42900,150000,570000,930000,520000),format="d")
Y17_CNT <- c(50,25,10,8,30,1,2,10,4,17)
AMT16 <- comma(c(100000,700000,50000,125000,760000,300000,130000,400000,250000,550000),format="d")
Y16_CNT <- c(40,30,5,3,28,6,2,7,2,16)
table <- data.frame(ID, SEX, AGE, AREA, AMT17, Y17_CNT, AMT16, Y16_CNT)
table
View(table)
write.csv(table, file="Sample1.csv")
write_xlsx(table, path="C:/Rstudy/Sample1.xlsx")
exdata1 <- read_excel("Sample1.xlsx")
View(exdata1)
str(exdata1)
dim(exdata1)
ls(exdata1)

install.packages("dplyr")
library(dplyr)
exdata1 <- rename(exdata1, Y17_AMT=AMT17, Y16_AMT=AMT16)
View(exdata1)

exdata1$AMT <- exdata1$Y17_AMT + exdata1$Y16_AMT
exdata1$CNT <- exdata1$Y17_CNT + exdata1$Y16_CNT
View(exdata1)
exdata1$AVG_AMT <- exdata1$AMT/exdata1$CNT
View(exdata1)
exdata1$AGE50_YN <- ifelse(exdata1$AGE >= 50, "Y", "N")
View(exdata1)
exdata1$AGE_GR10 <- ifelse(exdata1$AGE >= 50, "A1.50++",
                           ifelse(exdata1$AGE >= 40,"A2.4049",
                                  ifelse(exdata1$AGE >= 30, "A3.3039",
                                         ifelse(exdata1$AGE >= 20, "A4.2029",
                                                "A5.0019"))))
View(exdata1)
exdata1$AGE_GRADE <-
  ifelse(
    exdata1$AGE >= 1 & exdata1$AGE <= 18,
    "A",
    ifelse(
      exdata1$AGE >= 19 & exdata1$AGE <= 40,
      "B",
      ifelse(exdata1$AGE >= 41 &
               exdata1$AGE <= 60, "C", "D")
    )
  )
View(exdata1)
delete(exdata1$AGE_grade)
exdata1
exdata1 <- exdata1[,-c(14)]
View(exdata1)

exdata1 %>% select(ID)
exdata1 %>% select(ID, AREA, Y17_CNT)

exdata1 %>% select(-AREA)
exdata1 %>% select(-AREA, -Y17_CNT)
exdata1 %>% filter(AREA =='서울')
exdata1 %>% filter(AREA =='서울'& Y17_CNT >10)
exdata1 %>% arrange(AGE)
exdata1 %>% arrange(desc(Y17_AMT))
exdata1 %>% arrange(AGE, desc(Y17_AMT))


library(readxl)
m_history <- read_excel("C:/Rstudy/Sample2_m_history.xlsx")
View(m_history)

ID <- c(1,3,6,7,8,10)
SEX <- c("F","F","F","F","F","F")
AGE <- c(50,28,23,56,47,38)
AREA <- c("서울","제주","서울","경기","서울","경기")
AMT17<- c(1300000,275000,42900,150000,570000,520000)
Y17_CNT <- c(50,10,1,2,10,17)
AMT16 <- c(100000,50000,300000,130000,400000,550000)
Y16_CNT <- c(40,5,6,2,7,16)
library(writexl)
f_history <- data.frame(ID,SEX,AGE,AREA,AMT17,Y17_CNT,AMT16,Y16_CNT)
write_xlsx(f_history, path="C:/Rstudy/Sample3_f_history.xlsx")
f_history <- read_excel("C:/Rstudy/Sample3_f_history.xlsx")
View(f_history)
library(dplyr)
exdata_bindjoin <- bind_rows(m_history, f_history)
View(exdata_bindjoin)

ID <- c(1,2)
ADD <- c("서울","부산")
a <- data.frame(ID,ADD)

ID <- c(3,4)
SEX <- c("남","여")
b <- data.frame(ID, SEX)

bindjoin <- bind_rows(a, b)
View(bindjoin)


ID <- c(1,2,4,5,7,8,9,10)
SEX <- c("F","M","M","M","F","F","M","F")
AGE <- c(50,40,50,27,56,47,20,38)
AREA <- c("서울","경기","서울","서울","경기","서울","인천","경기")
AMT17 <- c(1300000,450000,400000,845000,150000,570000,930000,520000)
Y17_CNT <- c(50,25,8,30,2,10,4,17)
jeju_y17_history <- data.frame(ID,SEX,AGE,AREA,AMT17,Y17_CNT)
write_xlsx(jeju_y17_history, path="C:/Rstudy/Sample4_y17_history.xlsx")
jeju_y17_history <- read_excel("C:/Rstudy/Sample4_y17_history.xlsx")
View(jeju_y17_history)

ID <- c(1,2,3,4,5,6,7,8,9)
AMT16 <- c(100000,700000,50000,125000,760000,300000,130000,400000,550000)
Y16_CNT <- c(40,30,5,3,28,6,2,7,16)
jeju_y16_history <- data.frame(ID, AMT16, Y16_CNT)
write_xlsx(jeju_y16_history, path="C:/Rstudy/Sample5_y16_history.xlsx")
jeju_y16_history <- read_excel("C:/Rstudy/Sample5_y16_history.xlsx")
View(jeju_y16_history)
library(readxl)
jeju_y17_history <- read_excel("C:/Rstudy/Sample4_y17_history.xlsx")
jeju_y16_history <- read_excel("C:/Rstudy/Sample5_y16_history.xlsx")
View(jeju_y17_history)
View(jeju_y16_history)
bind_col <- left_join(jeju_y17_history, jeju_y16_history, by="ID")
library(dplyr)
bind_col <- left_join(jeju_y17_history, jeju_y16_history, by="ID")
bind_col_inner <- inner_join(jeju_y17_history, jeju_y16_history, by="ID")
bind_col_full <- full_join(jeju_y17_history, jeju_y16_history, by="ID")
View(bind_col)
View(bind_col_full)
View(bind_col_inner)
install.packages("psych")
library(psych)

x1 <- c(1, 2, 3, 4, 5, 6, 100)
x1
mean(x1)
median(x1)

x2 <- c(1, 2, 3, 4, 5, 100)
x2
median(x2)
max(x2)
min(x2)
range(x2)
quantile(x2)
quantile(x2, prob=0.25)
quantile(x2, prob=0.5)
quantile(x2, prob=0.75)
quantile(x2, prob=0.8)
var(x2)
sd(x2)
kurtosi(x2)
skew(x2)


exdata1 <- read_excel("C:/Rstudy/Sample1.xlsx")
exdata1

install.packages("descr")
library(descr)

freq_test <- freq(exdata1$AREA, plot=F)
freq_test
freq_test <- freq(exdata1$AREA)

library(readxl)
exdata1 <- read_excel("C:/Rstudy/Sample1.xlsx")
exdata1
stem(exdata1$AGE)
exdata1 <- read_excel("C:/Rstudy/Sample1.xlsx")
exdata1
hist(exdata1$AGE)
hist(exdata1$AGE, xlim=c(0, 60), ylim=c(0, 5), main="AGE분포")

freq(exdata1$SEX, plot=T, main='성별(barplot)')

dist_sex <- table(exdata1$SEX)
dist_sex
barplot(dist_sex)
barplot(dist_sex, ylim=c(0, 8))
barplot(dist_sex, ylim=c(0, 8), main="BARPLOT", xlab="SEX", ylab="FREQUENCY", names=c("Female", "Male"), col=c("pink", "navy"))

library(readxl)
exdata1 <- read_excel("C:/Rstudy/Sample1.xlsx")
exdata1

boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT)
boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT, ylim=c(0, 60), main="boxplot", names=c("17년건수", "16년건수"))
boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT, ylim=c(0, 60), main="boxplot", names=c("17년건수", "16년건수"), col=c("green", "yellow"))
y1 <- c(1,2,3,4,5,6,7,8,9,10,20,25)
boxplot(y1)

