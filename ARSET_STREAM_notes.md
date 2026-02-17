### Notes from NASA STREAM ARSET training in February 2026 (2 parts on 2/10 and 2/17)

1. Use map to find tiles (Landsat or S2)
2. Use example .py file to download .TIF files using API
3. Products available for download: Chla, Secchi, TSS, RGB, or all
4. Time series - Need to use QGIS
5. Raster analysis, zonal statistics
6. Need a special plugin to work with many rasters to make time series (multiband)
7. Gives ts of area-averaged in polygon or AOI
8. 

### Part 2 - Details on MDN algorithm
1. MDN code available as .ipynb (https://github.com/ryan-edward-oshea/MDN_tutorials)
2. The O'Shea group at Goddard is developing their own atm corr scheme
3. For now, use L2 data (rrs).
4. For atm, ACOLITE is recommended for coastal and inland waters, L2GEN for offshore
5. Gridded L2 data can be used as input (will need to check format)
6. Can email Ryan w/questions
