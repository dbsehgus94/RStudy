mid_exam <- read_excel("C:/Rstudy/mid_exam.xlsx")
mid_exam <- rename(mid_exam, MATH_MID=MATH, ENG_MID=ENG)
View(mid_exam)

final_exam <- read_excel("C:/Rstudy/final_exam.xlsx")
final_exam <- rename(final_exam,MATH_FINAL=MATH,ENG_FINAL=ENG)
View(final_exam)

total_exam <- inner_join(mid_exam, final_exam, by="ID")
View(total_exam)

total_exam$MATH_AVG <- (total_exam$MATH_MID+total_exam$MATH_FINAL) / 2
total_exam$ENG_AVG <- (total_exam$ENG_MID+total_exam$ENG_FINAL) / 2
View(total_exam)

total_exam$total_AVG <- (total_exam$MATH_MID + total_exam$MATH_FINAL + total_exam$ENG_MID + total_exam$ENG_FINAL) / 4
View(total_exam)
total_exam <- total_exam[,-c(9)]
total_exam$total_AVG <- (total_exam$MATH_AVG*2 + total_exam$ENG_AVG*2) / 4
View(total_exam)

mean(total_exam$MATH_AVG)
mean(total_exam$ENG_AVG)

total_exam %>% filter(MATH_MID >= 80 & ENG_MID >= 90)
filter(total_exam, MATH_MID >=80 & ENG_MID >=90)
