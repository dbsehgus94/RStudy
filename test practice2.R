ID <- c("1", "2", "3", "4", "5")
NAME <- c("진", "슈가", "제이홉", "RM", "지민")
AGE <- c(28, 28, 27, 26, 25)
ROLE <- c("서브보컬", "리드래퍼", "메인댄서", "리더", "메인댄서")

bantang <- data.frame(ID, NAME, AGE, ROLE)
View(bantang)

library(writexl)
write_xlsx(bantang, path="C:/Rstudy/bangtan.xlsx")

library(readxl)
bangtan <- read_excel("C:/Rstudy/bangtan.xlsx")

library(dplyr)
bangtan <- rename(bangtan, "역할"=ROLE)
View(bangtan)

bangtan %>% filter(역할=="메인댄서")

ID <- c("6", "7")
NAME <- c("뷔", "정국")
AGE <- c(25, 23)
역할 <- c("서브보컬", "메인보컬")

bangtan2 <- data.frame(ID, NAME, AGE, 역할)
View(bangtan2)

bangtan_boys <- bind_rows(bangtan, bangtan2)
View(bangtan_boys)

ID <- c("1", "2", "3", "4", "5", "6", "7")
BIRTHDAY <- c(1204, 0309, 0218, 0912, 1013, 1230, 0901)
ROLE2 <- c(NA, NA, "서브래퍼", "메인래퍼", "리드보컬", NA, "리드댄서")
bangtan3 <- data.frame(ID, BIRTHDAY, ROLE2)
View(bangtan3)

bangtan_boys <- full_join(bangtan_boys, bangtan3, by="ID")
View(bangtan_boys)
