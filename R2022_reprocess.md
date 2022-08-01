## MODA and VSNPP R2022 Re-Process

### Plan:
1. Download new R2022 L2 files for GOM (/srv/imars-objects/gom/L2_MODA_R2022)
2. End "main" files on 6/30/2022
3. Start "sub" folders on 7/1/2022

### Order of IMaRS RP Operations
#### FK (or any ROI)
1. L3_1D_MODA/VSNPP
2. New set of CLIM files
3. Means - 7D and MO


ROI Order: Start w/MODIS, then move to VSNPP (VSNPP had issue late July 2022)
FK (started L3_1D production on Sunday 7/31)
/fk/L3_1D_MODA_r22/OC,SST4

No IOP, SST, or RRS for FK,FGB (GOM only)
Run manually through 3/1/2022 when "NRT" files begin
Backfill NRT files through 7/31/22 on 8/1 (need to remove "NRT" from filenames).
"Sub" directories will begin 8/1/22.

Next:
1. FGB (Started MODA OC on Monday 8/1/22)
2. WFS
3. GOM

### Other items:
1. New filenames for L2, keep all else consistent (DOY)
2. Standardize products between ROI (FK, FGB, WFS)
3. New CLIM files (keep 2003-2019 for MODA and 2013-2019 for VSNPP)
