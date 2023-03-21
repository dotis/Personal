## Dashboard v3 Notes


New Version of Dashboards
Using R/Quarto w/RStudio + Github

Boards for now:
1. FKNMS/FGBNMS (images, time series)
2. NOAA CPO Sanctuaries

TODO:
1. Time series
2. Page layout for each location
3. Front matter w/image
4. Navigation (keep it simple for now - locations listed along left side)
5. Get info from ERDDAP datasets (how to set scale, grab dates)
6. Tabsets: Two types:
 a. 4x2 panel of most recent images (tab between chlor_a/SST/sscape)
 b. Each image: tab between mean and anom - not for sscape)



### Questions for Ben/Tylar
What else is needed to publish?
How to set up github actions?
Why using these GBIF tiles?
Do we need to pull actual raster data?




### What do users want?
1-km ocean color imagery?
climate info (see list below)

### Global L3 Ocean Color (8D or MO?)
1. chl_ocx, nflh, sst4, others for general use in any ROI/sanctuary
2. Do we need to serve images, or just extracted time series?
3. For now, use 1-km images and extracted t-s for FGB and FK.
4. Need to put extracted time series in "public_html" which is now on manglilloo?
5. 



Ideas:
Climate and other info for each NMS (FGB, FG, GR) - Others?
SST, sea level, air temp, RH, Others?
 - Show long term data w/trends
 - Calculate Sen slope?


How to organize image files? 
By year?
Panels?
How to handle time?
Can a user click on a time series and an image will generate?
 - Probably need shiny
 - 






### Meeting w/Jenn Brown 2/3/2023
Zac Canizzo - looking at climate info needs for each sanctuary.
How can we provide info?

List of climate hazards from NOAA CVA appendices:
1. Air temperature
2. Sea surface temperature
3. Precipitation
4. Salinity
5. Deoxygenation
6. pH
7. Sea level rise
8. Wave action
9. Upwelling
10. Currents/mixing/ stratification
11. Coastal erosion

