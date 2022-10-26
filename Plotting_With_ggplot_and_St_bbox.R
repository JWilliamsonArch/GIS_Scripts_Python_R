# Load the libraries.  SF for handling the data, and you're gonna want to 
# use a filter/something to clip down the data for the points, so you will need
# tidyverse.
library(sf)
library(tidyverse)
# Then load your gis data.  Select where the file is, and if using windows,
# make sure you are using \ rather than / because you'll get funny chars in 
# path otherwise.  Wisemen say "use the correct crs or get bad plots at best"
Points.Vector <- st_read("GISFILE.gpkg")
Polygon.Vector <- st_read("GISFILE2.gpkg")
# if you want to filter the points, do it here

# create a bounding box around the point file
Limits.Point.Vect <- st_bbox(Points.Vector)
# use the separate numbers within this to set up your limits
x.Limits.Point.Vect <- Limits.Point.Vect[c(1,3)]
y.Limits.Point.Vect <- Limits.Point.Vect[c(2,4)]
# then plot your data with the backdrop. 
ggplot() +
  ggtitle("Observations") +
  xlim(x.Limits.Point.Vect)+
  ylim(y.Limits.Point.Vect)+
  geom_sf(data = Polygon.Vector, fill = "grey") +
  geom_sf(data = Points.Vector, size = 0.4, color = "green")

