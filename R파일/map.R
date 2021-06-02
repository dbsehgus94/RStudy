install.packages("devtools")
library(devtools)
install_github("dkahle/ggmap")
library(ggmap)

googleAPIkey = ""
# Seoul의 위치 정보를 가져온 후 gg_seoul 변수에 할당
register_google(googleAPIkey) # Google API key 인증
gg_seoul <- get_googlemap("seoul", maptype = "hybrid")
ggmap(gg_seoul)

library(dplyr)
library(ggplot2)

geo_code <- enc2utf8("대전역") %>% geocode()
geo_data <- as.numeric(geo_code)

get_googlemap(center=geo_data, maptype="roadmap", zoom=13) %>% ggmap()+
  geom_point(data=geo_code, aes(x=geo_code$lon, y=geo_code$lat))
