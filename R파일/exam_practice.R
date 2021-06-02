CLASS <- c("class1", "class1", "class1", "class1", "class1", "class2", "class2", "class2", "class2", "class2", "class3", "class3", "class3", "class3", "class3")
ID <- c("1", "2", "3", "4", "5", "1", "2", "3", "4", "5", "1", "2", "3", "4", "5")
MATHEMATICS <- c(50, 90, 95, 60, 80, 100, 90, 65, 75, 50, 80, 55, 70, 65, 90)
ENGLISH <- c(50,80,100,60,80,90,70,80,75,45,85,55,80,55,75)
middle_mid_exam <- data.frame(CLASS, ID, MATHEMATICS, ENGLISH)
View(middle_mid_exam)
library(writexl)
write_xlsx(middle_mid_exam, path="C:/Rstudy/middle_mid_exam.xlsx")
library(readxl)
middle_mid_exam <- read_excel("C:/Rstudy/middle_mid_exam.xlsx")
View(middle_mid_exam)

library(dplyr)

install.packages("reshape2")
library(reshape2)

MATHEMATICS <- middle_mid_exam %>% select(CLASS, ID, MATHEMATICS)
View(MATHEMATICS)
MATHEMATICS <- dcast(MATHEMATICS, ID ~ CLASS)
View(MATHMATICS)
ENGLISH <- middle_mid_exam %>% select(CLASS, ID, ENGLISH)
View(ENGLISH)
ENGLISH <- dcast(ENGLISH, ID ~ CLASS)
View(ENGLISH)

middle_mid_exam %>% group_by(CLASS) %>% 
  summarise(ENG_MEAN = mean(ENGLISH), ENG_SUM = sum(ENGLISH))
middle_mid_exam %>% group_by(CLASS) %>% 
  summarise(MATH_MEAN = mean(MATHEMATICS), MATH_SUM = sum(MATHEMATICS))

math90 <- filter(MATHEMATICS, class1 >= 80)
summarise(math90, n())

arrange(middle_mid_exam, desc(MATHEMATICS), ENGLISH)

middle_mid_exam %>% filter(MATHEMATICS>=80 & ENGLISH>=85) %>% summarise(n())
filter(middle_mid_exam, MATHEMATICS>=80 & ENGLISH>=85) %>% summarise(n())


