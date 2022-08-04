### IMaRS OC/SST 1km MODA/VSNPP file structure

Last Update: 8/3/2022
MODA (r2022)
VSNPP (r2018 - waiting for r2022)
No updates were made to SST for any platform in r2022

### MODA
### GoM OC(r2018 - keep for now; files are not large):
/srv/imars-objects/gom/L2_MODA_r2018 (OC, IOP, SST,SST4)

### GoM OC(r2022):
/srv/imars-objects/gom/L2_MODA_r2022 (OC, IOP)

All "Sub" directories should start on 8/6/2022 (First five days of August will finish the 7-D bin at the end of July.


### VSNPP (Leave this until safe-mode issue is resolved and new files are produced)
### GoM OC(r2018 - keep for now; files are not large):
/srv/imars-objects/gom/L2_VSNPP (OC, SST,SST4)

### GoM OC(r2022 - waiting....):
/srv/imars-objects/gom/L2_VSNPP_r2022 (OC, IOP)

## CHECKLIST
1. L2 directory ends on 7/31; "sub" dir starts on 8/1
2. No weird characters in filenames
4. Mosaic_1D functions point to correct L2 files
5. Run full TS, then finish subs (VSNPP sub is empty for now until issue is resolved)
6. Run 7D, check automation
