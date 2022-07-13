# THese two top comments are for loading packages

# install.packages("sf")
# install.packages("tidyverse")

# Then load the packages
library(sf)
library(tidyverse)

# First get input for file path
Folder_Path <- readline(prompt="Which Folder?")
# Then output file path- be careful though! 
OutPut_Folder <- readline(prompt="Which folder do you want to put this into?")
# Then make a list of all of the files that are GPX
File_List <- list.files(path = Folder_Path, pattern = "\\.GPX", 
                        ignore.case = TRUE)
# Make a for loop to run through the GPX files
for(i in seq_along(File_List)){
  File_Path <- str_c(Folder_Path, "/", File_List[[i]])
  if(Index == 1){
    GPS_Points <- st_read(File_Path)
  } else{
    GPS_Points <- rbind(GPS_Points, st_read(File_Path))
  }
}
# create a new variable just for the Geometry, and use stringr to tidy it up.
GPS_Points_Geom <- GPS_Points$geometry %>%
  toString(.) %>%
  str_replace_all(., "c\\(", " ") %>%
  str_replace_all(., "\\)", " ") %>% 
  str_split(., " ,") %>% 
  unlist(.)
#  Make another one for the elevation
GPS_Points_Elev <- GPS_Points$ele %>%
  toString(.) %>%
  str_split(., ", ") %>% 
  unlist(.)
# Create a column of the two of these together
GPS_Points_Loc <- c()
for(i in seq_along(GPS_Points_Geom)){
  GPS_Points_Loc <- c(GPS_Points_Loc, 
                      str_c(GPS_Points_Geom[[i]], 
                            ", ",
                            GPS_Points_Elev[[i]]))
}
# Then just output this to CSV and shp file 
GPS_Points <- add_column(GPS_Points, GPS_Points_Loc) %>%
  write_csv(., str_c(OutPut_Folder, "/GPSPoints.csv"), append = FALSE) %>% 
  st_write(., str_c(OutPut_Folder, "/GPSPoints.shp"))
