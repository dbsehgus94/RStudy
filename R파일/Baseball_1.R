W <- c(8, 21, 15, 21, 21, 22, 24)
L <- c(5, 10, 12, 14, 17, 14, 19)

Win.Pct <- 100*W / (W+L)
View(Win.Pct)

Year <- seq(1946, 1952)
# seq함수는 순차적으로 보여주는거 1946~1952
# Year <- 1946:1952도 같은 결과를 보여줌
Age <- Year-1921
Plot <- plot(Age, Win.Pct)
# Plot함수를 사용해서 x축 Age y축 Win.Pct의 도표를 보여줌
mean(Win.Pct)
# Win.Pct의 평균값
100*sum(W)/ (sum(W) + sum(L))
# 바로 결과값 나옴(벡터 지정 안해도)
sort(W)
# W 벡터를 오름차순으로 정렬해서 보여줌
cumsum(W) 
# W 벡터의 누적합을 보여줌(마지막 값으로 벡터 내에 합친 값 확인)
summary(Win.Pct)
# Win.Pct벡터의 요약값을 보여줌(최소,최대,중간값,평균,1,3사분위수)
W[c(1,2,5)]
# W벡터 안에서 1,2,5번째를 추출
W[1:4]
# W벡터의 1~4번째까지 추출
W[-c(1,6)]
# W벡터 내에서 1,6번째를 제외한 나머지를 추출
Win.Pct>60
# Win.Pct벡터내에 값을 60과 비교하여 맞으면 TRUE 틀리면 FALSE 추출
(W>20)&(Win.Pct>60)
# 두 개의 조건식을 만족하면 TRUE 아니면 FALSE로 추출
Win.Pct == max(Win.Pct)
Year[Win.Pct == max(Win.Pct)]
Year[W+L>30]
