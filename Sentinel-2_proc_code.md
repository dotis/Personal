### S2 Processing
 - Use manglillo
 - Can't use ocssw
 - Use C2RCC instead

#### Band wavelengths for S2 A and B:
            S2A    S2B
Lambda(1) = 443    442  
Lambda(2) = 492    492  
Lambda(3) = 560    559  
Lambda(4) = 665    665   
Lambda(5) = 704    704  
Lambda(6) = 740    739  
Lambda(7) = 783    780  
Lambda(8) = 835    835  
Lambda(9) = 865    864  
Lambda(10) = 945   943  
Lambda(11) = 1613  1611  
Lambda(12) = 2200  2184  

Vicarious calibration on S2A only (for now).

#### Processing Scheme (updated September 2024)
1. API call to get images (can we filter by tileID and cloud%?)
2. Subset to ROI (not really needed; tiles are small)
3. l2gen will not work for now (formatting issue)
4. Use C2RCC instead
 - Graph node 1: subsample to 20m (could try 10m, but makes files REALLY large) 
 - Graph node 2: C2RCC
5. Prods? - conc_chl, conc_tsm, iop, etc. (limit output as needed - files get BIG)
6. Questions:
   - Can we filter file orders by tileID and cloud%?
   - How to handle ancillary data? (must use TOMSOMI and NCEP data from NASA; dead link) - Use default for now
   - Flag use? (clouds, cloud shadow, straylight)
7. Analysis:
 - Extract in small areas (offshore, reef, canals, backcountry)
 - Can add bandmaths operator and add calculated product(s) - Chl, TSM, other "indices"

