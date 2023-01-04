## IMaRS Ocean Color and SST 1-km Level-2 processing 
### Updated 1/4/2023

root path for .m files: /home1/dotis/DB_files/DB_v2

### 1D MOSAIC

New functions have been created for 1D mosaic of MODIS and VIIRS data.

"MOSAIC_1D_func_GOMdb_v2023.m"

This new function covers all sensors and ROI.

To run this function with all needed params for dashbaords, use: "run_mosaic_1D_GOMdb_v2023.m"

This is executed via cron using: "mosaic_1D_GOMdb_v2023_cron.sh"



### 7D MEAN

