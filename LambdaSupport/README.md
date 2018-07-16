# UPDATE 2018

The driver has been restructured to work with newer vendor code. Currently, libcommon has been retired in
favor of a new library libfsdetcore. The prebuilt libraries for liblambda.0.9 and libfsdetcore.0.8 are
provided in ./os/linux-x86_64. These have been tested on a Lambda 60K detector. To use different versions
of the vendor libraries, first download the zip archive of the selected branch from bitbucket:

* liblambda	https://stash.desy.de/projects/FSDSDET/repos/liblambda/browse
* libfsdetcore	https://stash.desy.de/projects/FSDSDET/repos/libfsdetcore/browse

You can build different versions of both liblambda and libfsdetcore by simply changing the download URL in the vendor.sh
script, and running: 
```
bash vendor.sh
```

By default, it downloads the most recent master branch commit.

Next, enter the liblambda-linux-x86_64 and libfsdetcore-linux-x86_64 directories created by the script, and copy the 
generated libraries into ./os/linux-x86_64, replacing the ones currently there, and copy the include files into
the ./vendorinclude/fsdetector directory, also replacing the lambda and core folders with the new ones.

From here, alter the Makefile in this directory to include the new libraries, and add any updated/changed 
header files.

Finally, before compilation, make sure to run the following command from the LambdaSupport directory:
```
export LD_LIBRARY_PATH=$(pwd)/os/linux-x86_64
```

The ADLambda driver can now be compiled from the top level.

#### IMPORTANT NOTE: 

When compiling the newest versions of the master branch from each of the library repositories, we found the
detector would read images as having dimensions of 0 by 0, an error remedied by pulling a different branch
suggested by the vendor. Make sure to utilize the correct versions of the library when compiling. 


### OLD VERSION

The files included in the directories libcommon and liblambda provide the source code for the low level driver 
provided with this detector.  These files are provided by 
  * X-Spectrum  http://www.x-spectrum.de/
  * DESY http://www.desy.de/
The developers of this camera.

The version of the drivers provided here are the working copy used to develop this driver for use with
EPICS areaDetector.  Up to date versions of the driver can be located here:
  * libcommon  https://stash.desy.de/projects/FSDSDET/repos/libcommon/browse
  * liblambda  https://stash.desy.de/projects/FSDSDET/repos/liblambda/browse
  
The development of this driver was aided by examination of the driver written by DESY for the Tango control
system (http://www.tango-controls.org/) 
  http://svn.code.sf.net/p/tango-ds/code/DeviceClasses/Acquisition/2D/Lambda/trunk/

  
The driver code provided here is uncompiled.  Instructions for compiling 
this driver are located in the INSTALL file located in the liblambda
directory.  Integration of this build with the EPICS build will be easiest 
if the CMAKE_INSTALL_PREFIX described there is liblambda-$(EPICS_HOST_ARCH). 
  
