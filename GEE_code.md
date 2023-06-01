## Assorted GEE code copied from dotis@mail.usf.edu account
This account may deprecate, so important code pieces are here

### S5 TROPOMI for NOx

//var PR_USVI = ee.Geometry.Polygon(
//        [[[19.5, -68.5],
//          [19.5, -62.0],
//          [16.5, -62.0,],
//          [16.5, -68.5]]], null, false);
          
var PR_roi = ee.Geometry.Rectangle(-65.5,17.8,-67.3,18.5);

// Function to clip an image collection
//function clipCollection(image){
//  return image.clip(PR_roi);
//}

// Load images for May/June/July 2020 - IFC
var collection = ee.ImageCollection('COPERNICUS/S5P/NRTI/L3_NO2') //Product ID Here
          .select('NO2_column_number_density') // Band Name Here
          .filterDate('2021-01-01', '2021-04-01')
          .filterBounds(PR_roi);
 //         .map(clipCollection);
 //         .median();

var list = collection.toList(100, 0) ;
print(list)

// Select image from list using index
var image= ee.Image(list.get(32)); 

var VizParams = {min:0.00001, max:0.0001,'palette':['black', 'blue', 'purple', 'cyan', 'green', 'yellow', 'red']};
Map.addLayer(image, VizParams);
Map.setCenter(-66.12,18.45, 8);

// Create a dictionary of labels and visualizations.
//var vis = {
//  'December 2019': {bands: 'Dec', min: 0, max: 0.0004, palette: ['black', 'blue', 'purple', 'cyan', 'green', 'yellow', 'red']},
//  'January 2020': {bands: 'Jan', min: 0, max: 0.0004, palette: ['black', 'blue', 'purple', 'cyan', 'green', 'yellow', 'red']},
//  'February 2020': {bands: 'Feb', min: 0, max: 0.0004, palette: ['black', 'blue', 'purple', 'cyan', 'green', 'yellow', 'red']}
//};

// Set up the maps.
//var maps = [];
//for (var label in vis) {
  // Create and set up each map.
//  var map = ui.Map();
//  map.addLayer(img, vis[label]);
//  map.setControlVisibility(false);
//  map.add(ui.Label(label));
  // Add the maps to the list.
//  maps.push(map);
//}

// Link the maps.
//var linker = ui.Map.Linker(maps);

// Because they are linked, they all respond to this event.
//maps[0].setCenter(114.346, 30.553, 8);

// Set everything in the root panel to the list of widgets.
//ui.root.widgets().reset(maps);



//---------------------------------END-----------------------------------------------//

### Tampa Bay NOx
// Atlantic ROI
var TB_roi = ee.Geometry.Rectangle(-83.5,27.0,-81.5,28.5);

// Checking if geometry is ok
//Map.addLayer(TB_roi,{},'TB_roi') // it is ok.



// Load images for May/June/July 2020 - IFC
var collection = ee.ImageCollection('COPERNICUS/S5P/OFFL/L3_NO2') //Product ID Here
          .select('tropospheric_NO2_column_number_density') // Band Name Here
          .filterDate('2022-12-01', '2023-02-28')
//          .filterBounds(TB_roi);
//          .median();



// Function to clip an image collection
//function clipCollection(collection){
//return collection.clip(TB_roi);
// }

//var coll_clip = clipCollection(TB_roi);

// Add AOD collection
//var collection_aerindex = ee.ImageCollection('COPERNICUS/S5P/OFFL/L3_NO2') //Product ID Here
//          .select('absorbing_aerosol_index') // Band Name Here
//          .filterDate('2020-06-01', '2020-06-30')
//          .filterBounds(TB_roi);
//          .median();

//var list = collection.toList(1000, 0) ;
var list = collection.aggregate_array('system:index') // I like to use this way to see image's ID
//var list_aod = collection_aerindex.aggregate_array('system:index') // I like to use this way to see image's ID
print(list)
//print(list_aod)

// Select image from list using index
//var image= ee.Image(list.get(250)); 
// Filter a specific image in the collection:
//var image = collection.filter(ee.Filter.eq('system:index',list.get(25))).first(); 
//print('Filtered Image:',image)

// Set vizualization parameters for TIRS Band 10
// var VizParams = {min:25000, max:31000, 'bands':'B10','palette':'000000, FF0000'};
var VizParams = {min:0, max:0.00007,'palette':['black', 'blue', 'purple', 'cyan', 'green', 'yellow', 'red']};
//var VizParams_aerindex = {min:-15, max:10,'palette':['black', 'blue', 'purple', 'cyan', 'green', 'yellow', 'red']};

//  'February 2020': {bands: 'Feb', min: 0, max: 0.0004, palette: ['black', 'blue', 'purple', 'cyan', 'green', 'yellow', 'red']}
Map.setCenter(-82.5,28, 9);

var img_disp = collection.mean();
var image_disp_clip = img_disp.clip(TB_roi);

// Clip raw image to SJB Region and add to map
// var image_clip = image.clip(ATL_roi);
//Map.addLayer(image, VizParams, 'Image'); // Not all the images have data....
//Map.addLayer(collection.mean(), VizParams, 'NO2 Mean'); //Better to use weekly or monthly means?
//Map.addLayer(collection_aerindex.mean(), VizParams_aerindex, 'aerindex Mean'); //Better to use weekly or monthly means?
Map.addLayer(image_disp_clip, VizParams, 'NO2 Mean');



//---------------------------------END-----------------------------------------------//



### LST for San Juan using Landsat 8
// SJB_LST_calc
// Cloud-free daily images from Landsat-8 collection
// Filter on BQA band and clip to San Juan Bay, PR
// Compute surface radiance and surf temperature
// Requires atm_corr coefficients 
// Outputs image as GEOTIFF

// Define boundary (SJB)
var polygon = ee.Geometry.Polygon(
        [[[-66.25, 18.30],
          [-65.90, 18.30],
          [-65.90, 18.50],
          [-66.25, 18.50]]]);
          
// Convert bounds to JSON strings
var regionJSON = JSON.stringify(polygon.getInfo());
          
// Cloud Index Values
// 61440 = Cloudy (high probability), Cirrus*
// 59242 = Cloudy (high probability), maybe Cirrus
// 57344 = Cloudy (high probability), maybe Cirrus
// 56320 = Cloudy (high probability), Non-Cirrus
// 53248 = Cloudy (high probability) Non-Cirrus*
// 39936 = Cloudy (low probability) Non-Cirrus
// 36896 = Cloudy (low probability) Non-Cirrus
// 36864 = Cloudy (low probability) Non-Cirrus
// 28672 = Cloudy (low probability) Cirrus only*

// Set collection
var startDate = new Date('07/01/2017');
var endDate = new Date('12/01/2017');
//var collection = ee.ImageCollection('LC8_L1T')
var collection = ee.ImageCollection('LANDSAT/LC08/C01/T1_RT')

     .filterDate(startDate, endDate) // Date filter
//     .filterMetadata('CLOUD_COVER',"not_greater_than",20) // Cloud cover filter
// Path and row filters
    .filterMetadata('WRS_PATH',"equals",5)
    //.filterMetadata('WRS_ROW',"not_less_than",56)
    .filterMetadata('WRS_ROW',"equals",47)

// Define list of images from collection here
var list = collection.toList(100, 0) ;
print(list)

// Select image from list using index
var image= ee.Image(list.get(5)); 
//print(image)




// TEST OF TOA alg. and CLOUD SCORE
// Convert the raw data to top-of-atmosphere reflectance.
var toa = ee.Algorithms.Landsat.TOA(raw);


// Load a cloudy Landsat scene and display it.
var cloudy_scene = ee.Image('LANDSAT/LC08/C01/T1_TOA/LC08_044034_20140926');
Map.centerObject(cloudy_scene);
Map.addLayer(cloudy_scene, {bands: ['B4', 'B3', 'B2'], max: 0.4}, 'TOA', false);

// Add a cloud score band.  It is automatically called 'cloud'.
var scored = ee.Algorithms.Landsat.simpleCloudScore(cloudy_scene);

// Create a mask from the cloud score and combine it with the image mask.
var mask = scored.select(['cloud']).lte(20);

// Apply the mask to the image and display the result.
var masked = cloudy_scene.updateMask(mask);
Map.addLayer(masked, {bands: ['B4', 'B3', 'B2'], max: 0.4}, 'masked');






// Set cloud index values using BQA Band (Noel at Google)
  var quality = image.select( 'BQA' );
  var cloud01 = quality.eq(61440);
  var cloud02 = quality.eq(59242);
  var cloud03 = quality.eq(57344);
  var cloud04 = quality.eq(56320);
  var cloud05 = quality.eq(53248);
  var cloud06 = quality.eq(39936);
  var cloud07 = quality.eq(36896);
  var cloud08 = quality.eq(36864);
  var cloud09 = quality.eq(28672);
// Are all needed? How to avoid overmasking?

// Set vizualization parameters for TIRS Band 10
var VizParams = {min:25000, max:31000, 'bands':'B10','palette':'000000, FF0000'};
Map.setCenter(-66.12,18.4, 11);

// Clip raw image to SJB Region and add to map
var image_raw = image.clip(polygon);
//Map.addLayer(image_raw, VizParams, "Base Scene",false);

// Create cloud mask based on BQA Band
var maskedimage = image.mask().and(cloud01.or(cloud02).or(cloud03).or(cloud04).or(cloud05).or(cloud06).or(cloud07).or(cloud08).or(cloud09).not());
//var maskedimage = image.mask().and(cloud01.or(cloud01).or(cloud09).not());
var image_masked_tmp = image.mask(maskedimage);

// Clip masked image to SJB Region and add to map
var image_masked = image_masked_tmp.clip(polygon);
Map.addLayer(image_masked, VizParams, "With Cloud Mask",true);



//print(image_raw.getInfo());

// Perform calculations on image2 (unmasked)
// Extract coefficients from imput image
//print(image_raw.getInfo());
var rad_mult = (image_raw.get('RADIANCE_MULT_BAND_10'));
print(rad_mult)
var rad_add = (image_raw.get('RADIANCE_ADD_BAND_10'));
print(rad_add)
var k1 = (image_raw.get('K1_CONSTANT_BAND_10'));
print(k1)
var k2 = (image_raw.get('K2_CONSTANT_BAND_10'));
print(k2)
var dt = (image_raw.get('DATE_ACQUIRED'));
print(dt)
var st = (image_raw.get('SCENE_CENTER_TIME'));
print(st)

// Calculate Radiance at TOA
// Coeffs. come from within image_raw (properties)
var B10_rad_toa = image_raw.expression("((rad_mult * B10_dn_toa) + rad_add)",
    {B10_dn_toa: image_masked.select("B10"),
     rad_mult: 0.0003342,
     rad_add: 0.1
    });
//Map.addLayer(B10_rad_toa);
 
// Calculate Radiance at surface (atm_corr)
// Coeffs. come from URL:http://atmcorr.gsfc.nasa.gov/
var B10_rad_surf = image_raw.expression("(((B10_rad_toa - Lu)/(e*t))-((1-e)/e)*Ld)",
    {B10_rad_toa: B10_rad_toa,
     Lu: 4.12,  // Upwelling radiance
     Ld: 6.08, // Downwelling radiance
     t: 0.50, // Transparency
     e: 0.95 // Emissivity
    });
//Map.addLayer(B10_rad_surf);

// Calculate Temp (in Deg C) at surface
// Coeffs. come from within image_raw (properties)
var LST_degC = image_raw.expression("(k2/log(k1/B10_rad_surf+1))-273.15",
    {B10_rad_surf: B10_rad_surf,
     k1: 774.89,
     k2: 1321.08
    });
    
var LST_degC = LST_degC.float();
//print(LST_degC)    
    
var LSTParams = {min:25, max:48,'palette':'000000, FF0000'};
    
// Create mask based on where LST < 25 DegC (cloud shadow)
  var cloud_thresh = LST_degC.lt(9.0);
    
// Define images for output and display
// 
var LST_masked_tmp = LST_degC.mask().and(cloud_thresh.not());   
var LST_masked = LST_degC.mask(LST_masked_tmp);
Map.addLayer(LST_masked,LSTParams,"LST");

// Add clipped RGB image to map (unmasked)
Map.addLayer(image_raw,
  {'bands':['B4', 'B3', 'B2'], 'min': 5000, 'max': 18000},"RGB Comp.");

var RGBExport = image_raw.visualize(['B4', 'B3', 'B2']).toUint8();

// Export raw RGB image for comparison w/heat map
Export.image(RGBExport, 'RGB', {
  region: regionJSON,
    crs: 'EPSG:4326',
  scale: 30
});




// Thumbnail preview
//print("Download preview:", LST_degC.getThumbURL({ 
//  region: regionJSON,
//  min:25, max:48,
//  palette:'000000, FF0000'
//}))

// Export LST - GEOTIFF Format
//Export.image(LST_masked, 'LST', {
//  region: regionJSON,
//  crs: 'EPSG:4326',
//  scale: 30
//});

//---------------------------------END-----------------------------------------------//

### Mask for SJB for cloud-free composites
// SJB_mask_calc
// Cloud-free composite (mosaic) for Landsat-8 collection
// Or, single image w/cloud mask
// Filter on BQA band and clip to San Juan Bay, PR
// Compute surface radiance and surf temperature
// Requires atm_corr coefficients 
// Outputs image (check format)

// Define boundary (SJB)
var polygon = ee.Geometry.Polygon(
        [[[-66.25, 18.30],
          [-65.90, 18.30],
          [-65.90, 18.50],
          [-66.25, 18.50]]]);
          
// Convert bounds to JSON strings
var regionJSON = JSON.stringify(polygon.getInfo());
          
// Cloud Index Values
// 61440 = Cloudy (high probability), Cirrus*
// 59242 = Cloudy (high probability), maybe Cirrus
// 57344 = Cloudy (high probability), maybe Cirrus
// 56320 = Cloudy (high probability), Non-Cirrus
// 53248 = Cloudy (high probability) Non-Cirrus*
// 39936 = Cloudy (low probability) Non-Cirrus
// 36896 = Cloudy (low probability) Non-Cirrus
// 36864 = Cloudy (low probability) Non-Cirrus
// 28672 = Cloudy (low probability) Cirrus only*

// Set collection
var startDate = new Date('9/01/2013');
var endDate = new Date('9/30/2013');
var collection = ee.ImageCollection('LC8_L1T')
    .filterDate(startDate, endDate).filterBounds(polygon)



// Select image from collection here
var list = ee.List(collection.getInfo().features);    //cast it expicitly as a list
print(list)

// Select image from list using index
var image2= ee.Image(list.get(22)); 
//print(image2)

// Choose individual image here
// How to substitute using image2 here?
var image = ee.Image('LC8_L1T/LC80050472013265LGN00')

// Set cloud index values using BQA Band (Noel at Google)
  var quality = image.select( 'BQA' );
  var cloud01 = quality.eq(61440);
  var cloud02 = quality.eq(59242);
  var cloud03 = quality.eq(57344);
  var cloud04 = quality.eq(56320);
  var cloud05 = quality.eq(53248);
  var cloud06 = quality.eq(39936);
  var cloud07 = quality.eq(36896);
  var cloud08 = quality.eq(36864);
  var cloud09 = quality.eq(28672);
// Are all needed? How to avoid overmasking?

// Set vizualization parameters for TIRS Band 10
var VizParams = {min:28000, max:32000, 'bands':'B10','palette':'000000, FF0000'};
Map.setCenter(-66.12,18.4, 11);

// Clip raw image to SJB Region and add to map
var image_raw = image.clip(polygon);
//Map.addLayer(image_raw, VizParams, "Base Scene",false);

// Create cloud mask based on BQA Band
//var maskedimage = image.mask().and(cloud01.or(cloud02).or(cloud03).or(cloud04).or(cloud05).or(cloud06).or(cloud07).or(cloud08).or(cloud09).not());
var maskedimage = image.mask().and(cloud01.or(cloud01).or(cloud09).not());
var image_masked_tmp = image.mask(maskedimage);

// Clip masked image to SJB Region and add to map
var image_masked = image_masked_tmp.clip(polygon);
//Map.addLayer(image_masked, VizParams, "With Cloud Mask",true);



//print(image_raw.getInfo());

// Perform calculations on image2 (unmasked)
// Extract coefficients from imput image
//print(image_raw.getInfo());
var rad_mult = (image_raw.get('RADIANCE_MULT_BAND_10'));
print(rad_mult)
var rad_add = (image_raw.get('RADIANCE_ADD_BAND_10'));
print(rad_add)
var k1 = (image_raw.get('K1_CONSTANT_BAND_10'));
print(k1)
var k2 = (image_raw.get('K2_CONSTANT_BAND_10'));
print(k2)
var dt = (image_raw.get('DATE_ACQUIRED'));
print(dt)
var st = (image_raw.get('SCENE_CENTER_TIME'));
print(st)

// Calculate Radiance at TOA
// Coeffs. come from within image_raw (properties)
var B10_rad_toa = image_raw.expression("((rad_mult * B10_dn_toa) + rad_add)",
    {B10_dn_toa: image_masked.select("B10"),
     rad_mult: 0.0003342,
     rad_add: 0.1
    });
//Map.addLayer(B10_rad_toa);
 
// Calculate Radiance at surface (atm_corr)
// Coeffs. come from URL:http://atmcorr.gsfc.nasa.gov/
var B10_rad_surf = image_raw.expression("(((B10_rad_toa - Lu)/(e*t))-((1-e)/e)*Ld)",
    {B10_rad_toa: B10_rad_toa,
     Lu: 3.76,  // Upwelling radiance
     Ld: 5.68, // Downwelling radiance
     t: 0.57, // Transparency
     e: 0.95 // Emissivity
    });
//Map.addLayer(B10_rad_surf);

// Calculate Temp (in Deg C) at surface
// Coeffs. come from within image_raw (properties)
var LST_degC = image_raw.expression("(k2/log(k1/B10_rad_surf+1))-273.15",
    {B10_rad_surf: B10_rad_surf,
     k1: 774.89,
     k2: 1321.08
    });
    
var LST_degC = LST_degC.float();
//print(LST_degC)    
    
var LSTParams = {min:25, max:48,'palette':'000000, FF0000'};
    
// Create mask based on where LST < 25 Degc
  var cloud_thresh = LST_degC.lt(25.0);
    
// Define images for output and display
// 
var LST_masked_tmp = LST_degC.mask().and(cloud_thresh.not());   
var LST_masked = LST_degC.mask(LST_masked_tmp);
Map.addLayer(LST_masked,LSTParams,"LST");

// Add clipped RGB image to map (unmasked)
Map.addLayer(image_raw,
  {'bands':['B4', 'B3', 'B2'], 'min': 5000, 'max': 18000},"RGB Comp.");

var RGBExport = image_raw.visualize(['B4', 'B3', 'B2']).toUint8();

// Export raw RGB image for comparison w/heat map
Export.image(RGBExport, 'RGB', {
  region: regionJSON,
    crs: 'EPSG:4326',
  scale: 30
});




// Thumbnail preview
//print("Download preview:", LST_degC.getThumbURL({ 
//  region: regionJSON,
//  min:25, max:48,
//  palette:'000000, FF0000'
//}))

// Export LST - GEOTIFF Format
Export.image(LST_masked, 'LST', {
  region: regionJSON,
  crs: 'EPSG:4326',
  scale: 30
});

//---------------------------------END-----------------------------------------------//

### S2 over Plancenia, Belize



var collection = sentinel2//.filter(ee.Filter.eq('MGRS_TILE','T17RNG'))
                  .filterBounds(lake) //filter by geometry
                  .filterDate('2020-01-01','2020-02-28') //filter by date
                  .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',30)) //filter by cloud coverage
                  

print(collection)

print(collection.aggregate_array('system:index'))

/// Load Cloud Mask function for Sentinel-2 Images
var CloudMaskFunction = require('users/lizcanosandoval/public/:/CloudScore_S2');
var CloudMask = function(image){
  var img = ee.Image(image);
  var mask = CloudMaskFunction.CloudScoreSR(img);
  return mask;
};

// function for retrieving suspended particles
// http://www.mdpi.com/2072-4292/9/7/761
var suspended_sediment = function(img){
  var scale = img.select('B7').divide(10000)
  var power = scale.pow(1.357)
  var mult = power.multiply(2950)
  return ee.Image(mult)
}


// APPLY CLOUD MASK FUNCTION
var mask = collection.map(CloudMask)

// Apply sediment particle function
var sp = collection.map(suspended_sediment)

var vis = {bands:['B4','B3','B2'],min:0,max:2500}
var vis2 = {min:5,max:25, palette: [
    '030d81', '0519ff', '05e8ff', '11ff01', 'fbff01', 'ff9901', 'ff0000',
    'ad0000'
  ]}
  
Map.addLayer(collection.median(),vis,'image')
Map.addLayer(mask.median(),vis,'image_masked')
Map.addLayer(sp.median(),vis2,'suspended matter')

//---------------------------------END-----------------------------------------------//

### Biscayne Bay WQ

var point = ee.Geometry.Point([-80.28, 25.43]);

var collection_S2 = ee.ImageCollection('COPERNICUS/S2_SR')
// var collection_S3 = ee.ImageCollection('COPERNICUS/S3/OLCI')
// var collectionLS8 = ee.ImageCollection('LANDSAT/LC08/C02/T1_L2')
// var collectionLS9 = ee.ImageCollection('LANDSAT/LC09/C02/T1_L2')

var collection = collection_S2
                  .filterBounds(point) //filter by geometry
                  .filterDate('2021-01-01','2021-06-30') //filter by date
//                  .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',50)) //filter by cloud coverage

// Tasks:
// 1. Cloud screening
// 2. Algorithm implementation
// 3. Image generation

var list = collection.toList(100, 0) ;
//var list = collection.aggregate_array('system:index') // I like to use this way to see image's ID

var list_ind=16;

// Select image from list using index
var image= ee.Image(list.get(list_ind)); 
print(image)
//print(list)

//print(collection)

/// Load Cloud Mask function for Sentinel-2 Images
var CloudMaskFunction = require('users/lizcanosandoval/public/:/CloudScore_S2');
var CloudMask = function(image){
  var img = ee.Image(image);
  var mask = CloudMaskFunction.CloudScoreSR(img);
  return mask;
};

// APPLY CLOUD MASK FUNCTION
var mask = collection.map(CloudMask)
Map.setCenter(-80.28, 25.5, 10);
var vis = {bands:['B4','B3','B2'],min:0,max:2500}
//print(mask)

var mask_list = mask.toList(100, 0) ;
print(mask_list)
var mask_image = ee.Image(mask_list.get(list_ind));

print(mask_image)

// Define single image from collection
// var disp_img = collection.first()
// print(disp_img)

// Map
// Map.addLayer(disp_img,vis,'image')
// Map.addLayer(mask.first(),vis,'image_masked')

Map.addLayer(image,vis,'image')
Map.addLayer(mask_image,vis,'masked image')

//---------------------------------END-----------------------------------------------//



