install.packages("dplyr")
install.packages("devtools")
library(devtools)
instaa_github("dkahle/ggmap")
library(ggmap)
library(dplyr)

station_data <- read.csv("역별_주소_및_전화번호.csv")
head(station_data)
str(station_data) # 속성 확인
googleAPIkey <- "AIzaSyAeIOe2iQulAU5IxEPnW2o032hQkCZDfN4"
register_google(googleAPIkey) # 구글 키 등록
station_code <- as.character(station_data$"역주소")
# as.character() 함수로 문자형으로 변환한 후 station_code에 할당
station_code <- geocode(station_code)
# geocode() 함수로 station_code 값을 위도와 경도로 변환
head(station_code) # station_code 테이터 앞부분 확인
station_cdoe <- as.character(station_data$"역주소") %>% enc2utf8() %>% geocode()
# 문자형으로 변환하고 utf8로 변환한 후 위도와 경도로 변환
head(station_code)
station_code_final <- cbind(station_data, station_code)
# station_data와 station_code를 합친 후 station_code_final에 할당
head(station_code_final)


apart_data <- read.csv("아파트(매매)__실거래가_20210423160320.csv")
head(apart_data)
apart_data$전용면적 = round(apart_data$전용면적)
# 전용면적의 값을 반올림하여 정수로 표현
head(apart_data)
count(apart_data, 전용면적) %>% arrange(desc(n))
# 전용면적을 기준으로 빈도를 구한 후 빈도에 따라 내림차순 정렬
apart_data_85 <- subset(apart_data, 전용면적 == "85")
# 전용면적이 85인 데이터만 추출하여 apart_data_85에 할당
head(apart_data_85)
apart_data_85$거래금액 <- gsub(",", "", apart_data_85$거래금액)
# 쉼표를 공백("")으로 대체하여 제거
head(apart_data_85)

apart_data_85_cost <- aggregate(as.integer(거래금액)~단지명, apart_data_85, mean)
# 거래금액을 정수형으로 변환하여 단지명별 평균을 구한 후 
# apart_data_85_cost 변수에 할당
head(apart_data_85_cost)

apart_data_85_cost <- rename(apart_data_85_cost, "거래금액"="as.integer(거래금액)")
# "as.integer(거래금액)"을 "거래금액"으로 변경하여 저장
head(apart_data_85_cost)

apart_data_85 <- apart_data_85[!duplicated(apart_data_85$단지명),]
# 단지명이 중복된 행을 제거하고 apart_data_85에 저장
head(apart_data_85)

apart_data_85 <- left_join(apart_data_85, apart_data_85_cost, by="단지명")
# "단지명"을 기준으로 apart_data_85의 apart_data_85_cost 합치기
head(apart_data_85)

apart_data_85 <- apart_data_85 %>% select("단지명", "시군구", "번지", "전용면적", "거래금액.y")
# "단지명", "시군구", "번지", "전용면적", "거래금액.y"만 추출하고 저장
apart_data_85 <- rename(apart_data_85, "거래금액"="거래금액.y")
# "거래금액.y"를 "거래금액"으로 변경한 후 저장
head(apart_data_85)

apart_address <- paste(apart_data_85$"시군구", apart_data_85$"번지")
# "시군구"와 "번지" 열을 합친 후 apart_address에 저장
# 공백 없이 합치려면 paste0() 사용
head(apart_address)

apart_address <- paste(apart_data_85$"시군구", apart_data_85$"번지") %>% data.frame()
# "시군구"와 "번지" 열을 합친 후 데이터 프레임 구조로 저장
head(apart_address)

apart_address <- rename(apart_address, "주소" = ".")
# "."을 "주소"로 변경하여 저장
head(apart_address)

apart_address_code <- as.character(apart_address$"주소") %>% enc2utf8() %>% geocode()
# 아파트 주소를 위, 경도로 변환하여 apart_address_code에 저장

apart_code_final <- cbind(apart_data_85, apart_address, apart_address_code) %>% select("단지명", "전용면적", "거래금액", "주소", lon, lat)
# 데이터 세트를 합친 후 일부 열만 apart_code_final에 저장
head(apart_code_final)

mapo_map <- get_googlemap("mapogu", maptype="roadmap", zoom=12)
# 마포구 지도 정보를 가져와 mapo_map에 저장

ggmap(mapo_map)
install.packages("ggplot2")
library(ggplot2)
ggmap(mapo_map) +
  geom_point(data = station_code_final, aes(x = lon, y = lat),
             colour = "red", size = 3) +
  geom_text(data = station_code_final, aes(label = 역명, vjust = -1))
# 산점도를 이용한 지하철역 위치 표시 및 역명 표시
hongdae_map <- get_googlemap("hongdae station", maptype = "roadmap", zoom = 15)
# 홍대입구역 지도 정보를 가져와 hongdae_map 변수에 저장

ggmap(hongdae_map) + 
  geom_point(data = station_code_final, aes(x = lon, y = lat), colour = "red", size = 3)+
  geom_text(data = station_code_final, aes(label = 역명, vjust = -1)) +
  geom_point(data = apart_code_final, aes(x = lon, y = lat)) +
  geom_text(data = apart_code_final, aes(label = 단지명, vjust = -1)) +
  geom_text(data = apart_code_final, aes(label = 거래금액, vjust = 1))
# 홍대입구역 지도에 지하철 정보 및 아파트 정보 일괄 표시