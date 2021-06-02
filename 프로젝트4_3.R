install.packages("dplyr")
install.packages("devtools")
library(devtools)
install_github("dkahle/ggmap")
library(ggmap)
library(dplyr)

station_data <- read.csv("소새울역_주소.csv")
head(station_data)
str(station_data)
googleAPIkey <- "AIzaSyAeIOe2iQulAU5IxEPnW2o032hQkCZDfN4"
register_google(googleAPIkey)
station_code <- as.character(station_data$"역주소")
station_code <- geocode(station_code)
head(station_code)
station_cdoe <- as.character(station_data$"역주소") %>% enc2utf8() %>% geocode()
head(station_code)
station_code_final <- cbind(station_data, station_code)
head(station_code_final)


apart_data <- read.csv("경기도_부천시_아파트_실거래가.csv")
head(apart_data)
apart_data$전용면적 = round(apart_data$전용면적)
head(apart_data)
count(apart_data, 전용면적) %>% arrange(desc(n))
apart_data_85 <- subset(apart_data, 전용면적 == "85")
head(apart_data_85)
apart_data_85$거래금액 <- gsub(",", "", apart_data_85$거래금액)
head(apart_data_85)

apart_data_85_cost <- aggregate(as.integer(거래금액)~단지명, apart_data_85, mean)
head(apart_data_85_cost)

apart_data_85_cost <- rename(apart_data_85_cost, "거래금액"="as.integer(거래금액)")
head(apart_data_85_cost)

apart_data_85 <- apart_data_85[!duplicated(apart_data_85$단지명),]
head(apart_data_85)

apart_data_85 <- left_join(apart_data_85, apart_data_85_cost, by="단지명")
head(apart_data_85)
apart_data_85 <- apart_data_85 %>% select("단지명", "시군구", "번지", "전용면적", "거래금액.y")
apart_data_85 <- rename(apart_data_85, "거래금액"="거래금액.y")
head(apart_data_85)

apart_address <- paste(apart_data_85$"시군구", apart_data_85$"번지")
head(apart_address)
apart_address <- paste(apart_data_85$"시군구", apart_data_85$"번지") %>% data.frame()
head(apart_address)

apart_address <- rename(apart_address, "주소" = ".")
head(apart_address)
apart_address_code <- as.character(apart_address$"주소") %>% enc2utf8() %>% geocode()
apart_code_final <- cbind(apart_data_85, apart_address, apart_address_code) %>% select("단지명", "전용면적", "거래금액", "주소", lon, lat)
head(apart_code_final)
bucheon_map <- get_googlemap("bucheon", maptype="roadmap", zoom=12)


ggmap(bucheon_map)
install.packages("ggplot2")
library(ggplot2)
ggmap(bucheon_map) +
  geom_point(data = station_code_final, aes(x = lon, y = lat),
             colour = "red", size = 3) +
  geom_text(data = station_code_final, aes(label = 역명, vjust = -1))
sosaeul_map <- get_googlemap("sosaeul station", maptype = "roadmap", zoom = 15)


ggmap(sosaeul_map) + 
  geom_point(data = station_code_final, aes(x = lon, y = lat), colour = "red", size = 3)+
  geom_text(data = station_code_final, aes(label = 역명, vjust = -1)) +
  geom_point(data = apart_code_final, aes(x = lon, y = lat)) +
  geom_text(data = apart_code_final, aes(label = 단지명, vjust = -1)) +
  geom_text(data = apart_code_final, aes(label = 거래금액, vjust = 1))
