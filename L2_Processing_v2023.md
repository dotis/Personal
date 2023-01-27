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



### RSYNC to ERDDAP (dune - neeed to use IP instead)
rsync -hazv /srv/imars-objects/fk/MEAN_7D_MODA/OC/* dotis@131.247.136.200:/mnt/sdb/moda_oc_7d_fk/
rsync -hazv /srv/imars-objects/fk/MEAN_7D_MODA/SST4/* dotis@dune/mnt/sdb/moda_sst4_7d_fk/
rsync -hazv /srv/imars-objects/fk/MEAN_7D_MODA/SST/* dotis@dune/mnt/sdb/moda_sst_7d_fk/
rsync -hazv /srv/imars-objects/fk/MEAN_7D_VSNPP/OC/* dotis@dune/mnt/sdb/vsnpp_oc_7d_fk/
rsync -hazv /srv/imars-objects/fk/MEAN_7D_VSNPP/SSTN/* dotis@dune/mnt/sdb/vsnpp_sstn_7d_fk/
rsync -hazv /srv/imars-objects/fgb/MEAN_7D_MODA/OC/* dotis@dune/mnt/sdb/moda_oc_7d_fgb/
rsync -hazv /srv/imars-objects/fgb/MEAN_7D_MODA/SST4/* dotis@dune/mnt/sdb/moda_sst4_7d_fgb/
rsync -hazv /srv/imars-objects/fgb/MEAN_7D_MODA/SST/* dotis@dune/mnt/sdb/moda_sst_7d_fgb/
