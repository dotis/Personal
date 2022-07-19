## Summer 2022 Gulf of Mexico Water Quality project 

Google Drive folder to archive datasets: https://drive.google.com/drive/folders/1cpEVYC_6ccVjWAcrCjKYZiWrWASf8Thk?usp=sharing

### Goals: 

1. Find and perform quality control on in-situ water quality measurements from the GoM. A compiled dataset already exists for South FL.

Possible sources:

GCOOS https://gcoos.org/ (emailed Marion)

NDBC (National Data Buoy Center) https://www.ndbc.noaa.gov/

USGS NWIS https://waterdata.usgs.gov/nwis (Mike Lee will email some files from TX)

TCEQ - water quality viewer - https://www80.tceq.texas.gov/SwqmisPublic/index.htm

Louisiana DEQ WQ mapper - https://waterdata.deq.louisiana.gov/Projects/WQ1958001

FL Water Atlas - https://wateratlas.usf.edu/

## Look at seasonality (SST)

WQ Portal (set here for Lk. Ponchartrain and NWIS only - can add STORET and STEWARDS)
https://www.waterqualitydata.us/#within=10&lat=30.21&long=-90.121&startDateLo=01-01-2003&startDateHi=12-31-2021&mimeType=csv&dataProfile=resultPhysChem&providers=NWIS

Downloads a large .csv file - import into ML as table

Others? Michelle J. at FGBNMS, Katie Shamberger at Texas A&M

Time series criteria: 
At least 10 years in length
Presently being sampled is desirable

Filter by: length (10 years+), currently sampled?, bathymetry (threshold?), 

In-situ products: Chlorophyll-a, SST (Temp.), Turbidity, CDOM absorption(? - may be hard to find)

## Tasks
1. TX Bay TCEQ sites (by "water segment", get a report for each. ML code to plot)
2. LA DEQ sites, define polygon, get 1 file w/all stations
3. Extract and plot sat. time series in interesting locations
4. Summary of each bay/estuary - What in-situ data exists?; what trend(s) are visible in sat and IS data?
5. New image panels by location.  New Orleans Delta/L. Pontchartrain, Mobile Bay (expand west) , Tampa Bay, Charlotte Harbor, Biscayne Bay





## Trends:
Many areas with positive Chla slopes and negative Rrs667 slopes.

Some interesting areas where this does not happen: 

SW of Vermillion Bay along LA coast (weird area w/positive Rrs667);  Upper reaches of Charlotte Harbor (neg. Rrs667 slopes)



### In situ water quality data
South FL: Merged dataset from AOML, which includes AOML, SERC, DERM, DEPECA, BC datasets


### Satellite data:

Use 1-km MODIS-Aqua monthly composites over entire GoM (01/01/2003-12/31/2021 - 19 years (228 months) total) 




Sat. Products: Chlorophyll-a, SST, Rrs667, aCDOM_443

Compare two filestreams: L3 1-km processed at USF and L3 4-km monthly data from OB-DAAC

### MATLAB Code to look at FKWQ data

Needed files: FKWQ_merged_CHLa.mat, FKWQ_merged_Turb.mat, FKWQ_Locations.mat, TurbSlopes.mat, ChlaSlopes.mat, Chla_stack.mat



## EXTRA USGS info (keep for now, can discard if not needed)
### USGS Site codes for WQ data 
07374525 - Mississippi River at Belle Chasse, LA
301528090064600 - Lake Pontchartrain at Causeway near Mandeville, LA
301001089442600 - Rigolets at Hwy 90 near Slidell, LA

### USGS product codes:
70953 - Chlorophyll a, phytoplankton, chromatographic-fluorometric method, micrograms per liter 
71851 - Nitrate, water, filtered, milligrams per liter as nitrate 
00600 - Total nitrogen [nitrate + nitrite + ammonia + organic-N], water, unfiltered, milligrams per liter 
00665 - Phosphorus, water, unfiltered, milligrams per liter as phosphorus 
00078 - Transparency, water, in situ, Secchi disc, meters 
70301 - Dissolved solids, water, filtered, sum of constituents, milligrams per liter  
00530 - Suspended solids, water, unfiltered, milligrams per liter 
80154 - Suspended sediment concentration, milligrams per liter  

00003 - Sampling depth, feet

curl -o /Users/imars_mbp/Downloads/test_wq.txt 'https://waterdata.usgs.gov/nwis/dv?cb_00600=on&format=rdb&site_no=301528090064600&referred_module=sw&period=&begin_date=1910-01-01'  


