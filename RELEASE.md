# ADDriver Releases

### 2018-16-07 R1-1 

Updated By Jakub Wlodek and Kazimierz Gofron

ADLambda has been updated to work with new vendor code and some new faetures have been added.

* Libcommon has been replaced with libfsdetcore
* Includes for Liblambda and libfsdetcore have been replaced/updated
* Vendor software uses a new namespace: DetLambdaNS instead of DetCommonNS, so this has been changed
* Support for a high and low threshold added since vendor code supports both.
* Manufacturer, Firmware, and SDK PVs are now populated correctly
* LambdaSupport reorganized:
	* Prebuilt libs are now included as in other AD drivers
	* Other versions of vendor libs can be built from source and substituted with script or manually
* Some additional printout statements added to driver to help with debugging
* Removed 'config' directory from iocBoot.
	* This directory is provided by X-Spectrum and should be copied into iocBoot by the user
	* It is no longer included because it contains a large number of binary config files which increases file size.


### 2017-03-01 R1-0

This version has been built against 
EPICS 3.14.12.5, synApps_5_8 (some packages to work with areadetector 2.0:calc-3-4-2. busy1-6-1, sscan-2-10-1, autosave-5-6-1, asyn-4-26) and areaDetector2-0, ADBinaries-2-2, ADCore-2-2
and
EPICS 3.15.5, synApps_5_8 (some packages to work with areadetector 2.5:calc-3-6-1. busy1-6-1, sscan-2-10-2, autosave-5-7-1, asyn-4-30) and areaDetector2-5 & ADSupport-1-0, ADCore-2-5
With 3.15.5 Was also built with EPICS-CPP-4.6.0 to allow NDPluginPva to allow some experimentation with pvAccess.

This version has most features of the detector working.  We have collected data at up to 2000 fps saving this data to IMM files using a custom PipeWriter File Plugin which passes data to 
an MPI program which compresses and saves the data to IMM.  At slower rates, other file plugins have been used successfully.

Much of the detector configuration is handled via configuration files.  Setting exposure time and switching between 12 and 24 bit acquisition are enabled.

Switching to external trigger modes is also enabled.

Switching to all data types except Float types is supported.
