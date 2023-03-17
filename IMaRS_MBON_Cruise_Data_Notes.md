### Notes on IMaRS data protocols

Ian Smith and Enrique Montes want to have a common approach to data inventory

How to boil down data into common "Master Speadsheet"?

What is the best format for this? Can we make a master list that can be queried?

Duplicate CDOM samples on recent cruises. We need to compare, but then AOML can run them going forward. When can we turn over to them.

For HPLC data we need to submit forms: calibration files, cruise logs, other PDFs, comments (who processed?, COV between samples), some header names have changed.

Sabastian: script to generate headers for SeaBASS sebastian. R Code?




Tasks:
1. Process and compare CDOM between AOML and USF. CDOM can then be done by AOML.
2. AOML needs a way to archive and serve spectral data.
4. Rrs data - can we compare above water Rrs with the two instruments? - Magnitudes are different, but Rrs seems comperable. Is this a unit issue?
 - IMaRS can stop doing scans, leave it to AOML with a new sensor.
 - Dave English can compare the two instruments before next cruise (R/V Hogarth leaving from St. Pete)
5. Need to coordinate data protocols with Ian and Enrique at AOML. 


Notes on data locations from Sebastian:

### To summarize data location:

mbon_imars_cruises: contains HPLC, GER, some BB3, raw CDOM, raw a_phyto/a_nap

HPLC is in its own folder
mbon_imars_cruises -> HPLC 

* raw CDOM, raw a_phyto/a_nap, GER, BB3
     rmbon_imars_cruises  -> years -> <year> -> <cruise_id> 
      - if data exists, it will have a sub folder:
      metadata - logs for cruise, lab, maps, etc, (i.e. non-data)
      apad - filter pads
      cdom - cdom
      radiometry or GER etc - radiometry, with GER1500 and/or SVC HR-512i
      bb3 - bb3

mbon_imars_cruises -> master 
 - contains downloaded data from SeaBass

mbon_imars_cruises -> process_logs
 - contains dates of newly processed data and filesnames (since Lilly and Mia)
 - spreadsheets contain chl if samples have been ran

IMaRS zooplankton data (I just sent)
- contains raw counts of data
- processed data, by sample and merged all together

I typically use R to find files by linking my Box account to my file explorer and searching that way, instead of downloading individuals files from box directly then moving into a project folder. 
 
 
