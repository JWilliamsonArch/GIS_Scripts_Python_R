library(sf)
library(tidyverse)

Polly_the_Polygon <- st_read("geopackage.gpkg") %>% 
  st_transform(., crs = 3857)
Dotty_the_Point <- st_read("dotty.gpkg") %>% 
  st_transform(., crs = 3857)
Parcels_the_names <- st_read("parcels.shp")%>% 
  st_drop_geometry(.)

In_Polgyon <- st_filter(Dotty_the_Point, Polly_the_Polygon, .predicate = st_within)


Out_Polygon <- filter(Dotty_the_Point, !Dotty_the_Point$Column1 %in% In_Polgyon$Column1) %>% 
  filter(., !Column1 %in% Parcels_the_names$Column2)

st_write(Out_Polygon, "Shake_it_all_about.gpkg", append=FALSE)
