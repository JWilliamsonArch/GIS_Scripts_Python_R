# GIS_Scripts_Python_R
This is a set of GIS Scripts to save me, and other people from having to type out little bits and pieces of code which can be copied and pasted.  
However, I'm making these as I'm learning coding in R and Python, so, if you have edits, send me a wee message.

## List

1. The RescalingRastersBatch.py is just a python tool that you can use to rescale a set of rasters from ArcGIS Pro, to automate that.

2. Conv_GPX2CSV.R is a script for creating a CSV and a set of Shapefiles from a set of GPX waypoint files(such as those produced by Garmin).  
It will ask for an input and an output folder path, and then create a file for the csv and the shapefiles.  
One of the columns in these will be a geometry column that can be copied and pasted to make it more useful.

3. Lines_To_ShapeAround.R is a small script to create a polygon, or a set of polygons around gridded lines.

4. Plotting_with_ggplot_and_st_bbox.R is a sample script for plotting a shapefile with a backdrop, and setting bounds to the overlain GIS File.

5. Negated_Spatial_Query.R is a small script to negate a spatial query.  As noted, this should have worked differently, however, I couldn't get the original version of 
the negated query with st_filter to work, so this is a positive to negative query transformation.

6. Leaflet_Little_Bits.R is a short script for R which changes an undefined layer "fc" to '4326', and then adds it to a leaflet map.
