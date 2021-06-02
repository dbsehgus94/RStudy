print("Hello world!") # Hello world 출력
3+5
100/7.2
x <- 10
x
x1 <- c(10, 20, 30)
x1
x2 <- c(10:15)
x2
x3 <- seq(10, 15)
x3
x4 <- seq(1, 10, by=4)
x4
y <- "hi"
y
y1 <- c('hello', 'hi', 'hello ~!')
y1
x4 <- x2
x4
ex_vector1 <- c(-1, 0, 1)
ex_vector1

ex_vector2 <- c("hello", "Hi~!")
ex_vector2
ex_vector3 <- c("1", "2", "3")
ex_vector3
str(ex_vector1)
length(ex_vector1)
str(ex_vector2)
str(ex_vector3)
ex_vector4 <- c(TRUE, FALSE, TRUE, FALSE)
ex_vector4
str(ex_vector4)
remove(ex_vector2)
rm(ex_vector3)
ex_vector3

x <- c(1, 2, 3, 4, 5, 6)
matrix(x, nrow=2, ncol=3)
matrix(x, nrow=3, ncol=2)
x <- c(1, 2, 3, 4, 5, 6)
matrix(x, nrow=2, ncol=3)
matrix(x, nrow=2, ncol=3, byrow=T)
y <- c(1, 2, 3, 4, 5, 6)
array(y, dim = c(2, 2, 3))
list1 <- list(c(1, 2, 3), "Hello")
list1
str(list1)
ID <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
SEX <- c("F", "M", "F", "M", "M", "F", "F", "F", "M", "F")
AGE <- c(50, 40, 28, 50, 27, 23, 56, 47, 20, 38)
AREA <- c("서울","경기","제주","서울","서울","서울","경기","서울","인천","경기")
dataframe_ex <- data.frame(ID,SEX,AGE,AREA)
dataframe_ex
str(dataframe_ex)

str(list1)
length(list1)
str(dataframe_ex)
length(dataframe_ex)
View(dataframe_ex)

ID <- c("1","2","3","4","5")
MID_EXAM <- c(10, 25, 100, 75, 30)
CLASS <- c("1반", "2반", "3반", "1반", "2반")
example_test <- data.frame(ID, MID_EXAM, CLASS)
example_test
ID <- c(1, 2, 3, 4, 5)
ID
SEX <- c("F", "M", "F", "M", "F")
SEX
DATA <- data.frame(ID = ID, SEX = SEX)
View(DATA)
install.packages("readxl")
library(readxl)
excel_data_ex <- read_excel("C:/Rstudy/data_ex.xls")
View(excel_data_ex)
excel_data_ex <- read_excel("C:/Rstudy/data_ex.xls", sheet=2)
View(excel_data_ex)
ex_data <- read.table("C:/Rstudy/data_ex.txt")
View(ex_data)
getwd()
ex_data1 <- read.table("C:/Rstudy/data_ex.txt", header = TRUE)
View(ex_data1)
ex_data2 <- read.table("C:/Rstudy/data_ex.txt", header = TRUE, skip = 2)
View(ex_data2)
ex_data3 <- read.table("C:/Rstudy/data_ex.txt", header = TRUE, nrow = 7)
View(ex_data3)
ex1_data <- read.table("C:/Rstudy/data_ex1.txt", header = TRUE, sep=",")
View(ex1_data)

varname <- c("ID", "SEX", "AGE", "AREA")
ex2_data <- read.table("C:/Rstudy/data_ex2.txt", sep=",", col.names=varname)
View(ex2_data)

ID <- c(1, 2, 3, 4, 5)
SEX <- c("F", "M", "F", "M", "F")
data_ex <- data.frame(ID=ID, SEX=SEX)
save(data_ex, file="data_ex.rda")
load("C:/Rstudy/data_ex.rda")
View(data_ex)

ID <- c(1, 2, 3, 4, 5)
SEX <- c("F", "M", "F", "M", "F")
data_ex <- data.frame(ID=ID, SEX=SEX)
write.csv(data_ex, file="C:/Rstudy/data_ex.csv")

ID <- c(1, 2, 3, 4, 5)
SEX <- c("F", "M", "F", "M", "F")
data_ex <- data.frame(ID=ID, SEX=SEX)
write.table(data_ex, file="C:/Rstudy/data_ex.txt", quote=FALSE)
# quote -> "를 지운다.


