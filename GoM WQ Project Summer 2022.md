## Summer 2022 Gulf of Mexico Water Quality project 

Google Drive folder to archive datasets: https://drive.google.com/drive/folders/1cpEVYC_6ccVjWAcrCjKYZiWrWASf8Thk?usp=sharing

### Goals: 

1. Find and perform quality control on in-situ water quality measurements from the GoM. A compiled dataset already exists for South FL.

Possible sources:

GCOOS https://gcoos.org/

NDBC (National Data Buoy Center) https://www.ndbc.noaa.gov/

USGS NWIS https://waterdata.usgs.gov/nwis

Others? Michelle J. at FGBNMS, Katie Shamberger at Texas A&M

Time series criteria: 
At least 10 years in length
Presently being sampled is desirable

Filter by: length (10 years+), currently sampled?, bathymetry (threshold?), 

In-situ products: Chlorophyll-a, SST (Temp.), Turbidity, CDOM absorption(? - may be hard to find)



### In situ water quality data
South FL: Merged dataset from AOML, which includes AOML, SERC, DERM, DEPECA, BC datasets


### Satellite data:

Use 1-km MODIS-Aqua monthly composites over entire GoM (01/01/2003-12/31/2021 - 19 years (228 months) total) 

Sat. Products: Chlorophyll-a, SST, Rrs667, aCDOM_443

Compare two filestreams: L3 1-km processed at USF and L3 4-km monthly data from OB-DAAC

### MATLAB Code to look at FKWQ data

Needed files: FKWQ_merged_CHLa.mat, FKWQ_merged_Turb.mat, FKWQ_Locations.mat, TurbSlopes.mat, ChlaSlopes.mat, Chla_stack.mat
