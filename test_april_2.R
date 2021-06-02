library(readxl)
dustdata <- read_excel("C:/Rstudy/finedust.xlsx")
View(dustdata)
str(dustdata)
library(dplyr)
dustdata_anal <- dustdata %>% filter(area %in% c("구로구", "금천구"))
View(dustdata_anal)
count(dustdata_anal, yyyymmdd) %>% arrange(desc(n))
count(dustdata_anal, area) %>% arrange(desc(n))
dustdata_anal_area_gr <- subset(dustdata_anal, area == "구로구")
dustdata_anal_area_gc <- subset(dustdata_anal, area == "금천구")
dustdata_anal_area_gr
dustdata_anal_area_gc
install.packages("psych")
library(psych)
describe(dustdata_anal_area_gr$finedust)
describe(dustdata_anal_area_gc$finedust)
boxplot(dustdata_anal_area_gr$finedust, dustdata_anal_area_gc$finedust, 
        main = "finedust_compare", xlab = "AREA", names = c("구로구", "금천구"),
        ylab = "FINEDUST_PM", col = c("blue", "green"))
t.test(data = dustdata_anal, finedust ~ area, var.equal = T)
