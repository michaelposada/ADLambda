# ADLambda

[EPICS](http://www.aps.anl.gov/epics/)
[areaDetector](http://cars.uchicago.edu/software/epics/areaDetector.html) 
 driver for the [X-Spectrum] (http://www.x-spectrum.de/) 
   [Lambda](http://www.x-spectrum.de/p1%20-%20si.htm) detector.
 
 See
 * [Documentation] (documentation/ADLambda.html)
 * See notes in LambdaSupport/README and LambdaSupport/liblambda/INSTALL about
    building the low level driver for this detector.
 
## Update July 2018

#### Installation:

The Lambda Driver has been reorganized to look similar to other EPICS drivers.
It now includes prebuilt vendor libraries:

* liblambda.0.9.so
* libfsdetcore.0.8.so

Libcommon from the previous versions of vendor code has been replaced with libfsdetcore, and so the older driver is
incompatible with newer vendor libraries. To install a different version of vendor libraries, enter the 
LambdaSupport directory, and run the vendor.sh script. More detailed installation instructions for the vendor
libs can be found in the LambdaSupport directory in the INSTALL-EPICS.md file.

Include files are found in LambdaSupport/vendorinclude/fsdetector. These and the libraries in 
LambdaSupport/os/linux-x86_64 are automatically replaced by the vendor.sh script.  

By default, the script gets the most recent version of both libs from the master branch. To configure the script to use a particular version of both libs, 
first create a directory in LambdaSupport called liblambda or libfsdetcore depending on which lib you will be manually selecting.
Download the appropriate version in the form of a zip archive from bitbucket (links can be found in the INSTALL-EPICS.md file)
and place said archive in the appropriate lib directory, naming it $(DIR_NAME).zip. For example a custom build of liblambda would involve
creating a directory liblambda, and placing the zip archive in said directory renaming it to liblambda.zip.

Then, open the vendor.sh script and change the LAMBDA_MANUAL or DETCORE_MANUAL variables to "YES" depending on which lib you are
building manually. Then run the script with
```
bash vendor.sh
```
**NOTE:** The provided prebuilt libs were built on a debian 8 machine and depend on libboost1.55. As a reuslt, building from source is required for 
machines that have different versions of libboost. Additionally, when building the most recent changes from the master branch, some unexpected errors
occurred. Contact the vendor to learn which branch or version of their code works best with your detector.

Once the vendor software is built, and the Makefile in LambdaSupport is edited as specified by LambdaSupport/README.md, running 
```
make
```
from this directory will build the driver.

#### Booting up the IOC

In order to start the IOC, one must first copy the 'config' folder provided by the vendor in the iocs/LambdaIOC/iocBoot/iocLambda
directory. Next, open the st.cmd file also in iocLambda, and make sure that in the LambdaConfig line, the correct path to this config
directory is specified. Additionally, you must configure the library path prior top starting the IOC, as liblambda depends on libfsdetcore.
```
export LD_LIBRARY_PATH=$PATH_TO_ADLAMBDA/LambdaSupport/os/linux-x86_64
```
Then simply run ./startEPICS.sh to start the IOC.

#### Changes

There were some changes made to make this driver work with the newer versions of liblambda and libfsdetcore. Look at RELEASE.md to
see these changes.
