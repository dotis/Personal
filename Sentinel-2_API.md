#### Query based on product type and ingestion date (using filename to specify S2 tile):
wget --no-check-certificate --user ddotisb3 --password MontBay3 --output-document=query_results.txt "https://scihub.copernicus.eu/dhus/search?q=ingestiondate:[NOW-10DAY TO NOW] AND filename:S2*_MSIL1C_*_*_*_T17RNJ_*.SAFE AND platformname:Sentinel-2 AND producttype:S2MSI1C&rows=100&start=0&format=json"

#### Dwonload using file UIID:
wget --content-disposition --continue --user=ddotisb3 --password=MontBay3 "https://scihub.copernicus.eu/dhus/odata/v1/Products('ae1e40f2-6071-451f-ae89-df1f728d3b7f')/\$value"

#### Question: How to get UUID out of query_text file that is generated?
Save query in json format, then unpack w/loadjson or other

Or, use dhusget:
#### dhusget.sh [LOGIN OPTIONS]... [SEARCH QUERY OPTIONS]... [SEARCH RESULT OPTIONS]... [DOWNLOAD OPTIONS]...
#### ./dhusget.sh -u ddotisb3 -p MontBay3 -d https://scihub.copernicus.eu/dhus/ -m Sentinel-2 -t 24 -c 25.0,-81.5:26.5,-79.5 -C ./products-list.csv -T S2MSI2A -l 10 -o manifest

#### Tiles for FL Keys:
1. T17RNJ (BB)
2. T17RNH (UK)
3. T17RMH (MK)
4. T17RLH (LK)

#### Questions:
1. Can we filter search results by tileID and cloud%?
2. 
