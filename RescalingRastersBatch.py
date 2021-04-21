# This is a program for fixing the shape of archaeological rasters in the landscape.
import arcpy

def main():

# The raster_list will be a list of dictionaries, which is going to be the place where the name of the input raster, the
# output raster and the scale will be studied.
    raster_list = [
    ]
    on_off = ""
    # This is the r_in variable, which is going to be used to make the raster_in value.
    r_in = 0
    # This is the r_out variable, which will be used to make the raster_out variable.
    r_out = 0
    # This is the scale to change the values by.
    scalefact = 0

    # This is the destination Geodatabase. It will prompt for the input.  Make sure that there is a backslash at the
# end of it.
    DestGDB = input("What is the destination Geodatabase called?")

    #This is the while loop to grab the values for where the features are coming from. It will run a loop through the
# on_off, then inputting the rasters, then doing the scalefact.  These will then be seated into a dictionary.
    while on_off != "q":
        r_in = input("What is the filename?")
        r_out = input("What will the filename be?")
        scalefact = input("What is the scale factor for this raster?")
        raster_list.append({
            "raster_in": r_in,
            "raster_out": DestGDB+r_out,
            "scale": scalefact
        })
        on_off = input("Do you want to continue? to stop press q")
# The next step is to place these all into the arcpy function we are using.  This is:
# arcpy.management.Rescale(in_raster, out_raster, scale x, scale y)
    for i in raster_list:
        in_raster=str(i["raster_in"])
        out_raster=str(i["raster_out"])
        scalexy=str(i["scale"])
        arcpy.management.Rescale(in_raster, out_raster, scalexy, scalexy)


if __name__ == '__main__':
    main()


