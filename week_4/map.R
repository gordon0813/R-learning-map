library(leaflet)
locate <- read.csv("1070919typhoonparking.csv")
options(digits=8)
a=locate$longitude

map <- leaflet() %>%
  addMarkers(lng=locate$Longitude,lat=locate$Latitude,popup=locate$loc) %>%
  addTiles() %>%
  fitBounds("120","23","122","24")
map