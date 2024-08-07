library(sf)
library(tidyverse)
library(leaflet)


sfc <- st_as_sf(fc) %>%
  st_transform(4326) %>% 
  st_set_crs(4326)

st_is_longlat(sfc)
leaflet() %>%
  addTiles() %>%
  addPolygons(data = sfc)