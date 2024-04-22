### Chelsea Bryant - Notes on thesis work

3/7/24 - Meet about GEE code for S2 turbidity
1. Relax/remove cloud threshold and mask clouds instead - get as many images as possible
2. ROI inside bay - Can't see it.
3. Time series starts in 2019 according to plot(?)
4. Need to multiply B4 (and all S2 bands) vals by 0.0001 to get reflectance
5. Implement algorithm below to get turbidity.
6. Identify images associated with spikes in time series
7. Display those images from (6) individually and look to see what is going on


#### One method for turbidity calculation from S2 data: (red, red edge) 
 - From Chowdhury et al. 2023 (https://doi.org/10.3389/fmars.2023)
 - Look at B4 at 665nm and B5 at Rrs665
 - If Rrs665<0.042: Turbidity=TurbidityRrs665
 - If Rrs665>0.042 and Rrs704>0.062: Turbidity=TurbidityRrs704
 - If Rrs665≥0.042 and Rrs704≤0.062: Turbidity = Turbidityweighted
 - Turbidityweighted=α×TurbidityRrs665+β×TurbidityRrs704
 - α = 0.062−Rrs665/0.062−0.042 , β=1−α

Interesting way to plot transect data:

<img src="https://github.com/dotis/Personal/assets/26553741/01bab6ad-cadd-4861-82e8-362e8a6c41c0" style="width:600px;height:300px;">


Equations from Chowdhurry:

<img src="https://github.com/dotis/Personal/assets/26553741/e565c8fb-20c2-4879-bceb-fb9bb9b9e6cf" style="width:600px;height:300px;">


MODIS turbidity files
/srv/imars-objects/tpa_pgs/usvi

 - L1A files ordered 4/22/24 to cover PR and USVI (17.5 to 18.9N; -67.5 to -64E)
 - Need to process to L2 and then map

