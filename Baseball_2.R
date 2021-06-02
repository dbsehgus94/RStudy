NL <- c("FLA","STL","HOU","STL","COL","PHI","PHI","SFG","STL","SFG")
AL <- c("NYY","BOS","CHW","DET","BOS","TBR","NYY","TEX","TEX","DET")
Winner <- c("NL","AL","AL","NL","NL","NL","AL","NL","NL","NL")
N.Games <- c(6,4,4,5,4,5,6,5,7,4)
Year <- 2003:2012

results <- matrix(c(NL,AL),10,2)
View(results)

dimnames(results)[[1]] <- Year
dimnames(results)[[2]] <- c("NL Team", "AL Team")

table(Winner)
# Winner벡터 내에 있는 object들에 대한 빈도수 표시
barplot(table(Winner))
# obtain a bar graph of the frequencies
NL2 <- factor(NL,levels=c("FLA","PHI","HOU","STL","COL","SFG"))
# factor 함수는 levels로 지정한 것을 차례대로 표기해 주는 함수
View(NL2)

World.Series <- list(Winner=Winner, Number.Games=N.Games, Seasons="2003 to 2012")
# list함수는 numeric, charater, logical, factors등
# 서로 다른 형태의 vector를 섞어서 쓸 수 있게 해주는 함수

by(N.Games, Winner, summary)
# Winner에 대한 N.Games의 summary를 보여주는 함수

HR <- c(13,23,21,27,37,52,34,42,31,40,54)
AB <- c(341,549,461,543,517,533,474,519,541,527,514)
Age <- 19:29

#임의의 함수지정 Name.of.function <- function(arguments)
hr.rates <- function(Age,HR,AB)
  rates <- round(100*HR/AB,1)
  list(x=Age,y=rates)

hr.rates(Age, HR, AB)
  # round(a, b): a를 소수점 1자리까지 표시(2번째 자리에서 반올림)

plot(hr.rates(Age, HR, AB))

getwd() # 현재 작업 중인 주소

baseball_example <- read.csv("name.csv")
write.csv(Mantle, "mantle.csv", row.names=FALSE)
