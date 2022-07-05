library(sf)
library(tidyverse)
library(tmap)

# Read in File
Lines_File <- st_read("YOUR_FILE_PATH")
# Set the CRS- in this case I've just chosen one, but you may need to change it.
st_crs(Lines_File) = 26920
# Do the buffers to 150m
Buffer_Lines <- st_buffer(Lines_File, 150)
# Dissolve the Buffers
Buffer_150mOut <- st_union(Buffer_Lines)
# Create a smaller buffer
Lined_Area <- st_buffer(Buffer_150mOut, -140)
# Warp the area to 3857
Lined_Area <- st_transform(Lined_Area, "+init=epsg:3857")


st_write(Lined_Area, "Lined_Area.gpkg", append = FALSE)



# Then plot the data to see how it looks
tmap_mode("view")
tm_tiles("Stamen.Watercolor")
tm_shape(Lined_Area)+
  tm_fill(col = "green")


