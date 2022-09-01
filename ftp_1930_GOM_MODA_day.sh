#!/bin/sh
wget --post-data="subID=1930&addurl=1&results_as_file=1" -O - https://oceandata.sci.gsfc.nasa.gov/api/file_search | wget -4 --load-cookies ~/.urs_cookies --save-cookie ~/.urs_cookies --keep-session-cookies --adjust-extension --auth-no-challenge=on  -P /srv/imars-objects/gom/L2_MODA_sub/ -i -
rm /srv/imars-objects/gom/L2_MODA_sub/*.1
