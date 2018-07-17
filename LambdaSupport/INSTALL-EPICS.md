# UPDATE 2018

The driver has been restructured to work with newer vendor code. Currently, libcommon has been retired in
favor of a new library libfsdetcore. The prebuilt libraries for liblambda.0.9 and libfsdetcore.0.8 are
provided in ./os/linux-x86_64. These have been tested on a Lambda 60K detector. These can be replaced with the
most recent versions from the master branch by simply running the **vendor.sh** script.To use different versions
of the vendor libraries, first download the zip archive of the selected branch from bitbucket:

* liblambda	https://stash.desy.de/projects/FSDSDET/repos/liblambda/browse
* libfsdetcore	https://stash.desy.de/projects/FSDSDET/repos/libfsdetcore/browse

then create a directory liblambda or libfsdetcore depending on which zip archive you are using, and place the archive 
there, renaming it to just (THE LIB NAME).zip.

Example:
```
LambdaSupport-|
	      |
	liblambda-|
		  |
		liblambda.zip
```
Then open the vendor.sh script with a text editor and set LAMBDA_MANUAL or DETCORE_MANUAL to YES for whichever lib is being
manually built.

Once this is set up, simply run the script with:
```
bash vendor.sh
```

By default, it downloads the most recent master branch commit.


From here, alter the Makefile in this directory to include the new libraries, and add any updated/changed 
header files. These will be housed in os/linux-x86_64 and vendorincludes/fsdetector respectively.

Finally, before compilation, make sure to run the following command from the LambdaSupport directory:
```
export LD_LIBRARY_PATH=$(pwd)/os/linux-x86_64
```

This will add the vendor libs to the library path

The ADLambda driver can now be compiled from the top level.

### IMPORTANT NOTES: 

* The provided prebuilt libraries have been built on a debian 8 machine which was running libboost1.55 among other dependant libraries. As a result, compiling with the prebuilt libs is only possible on debian 7 and 8. On debian 9 or other linux distributions, it is required to build the vendor code from source. Follow the instructions on setting up the vendor.sh script, and run it to do so. Prior to the vendor code being built, the CMake configuration file searches for the appropriate libraries, and stores their version numbers.
* When compiling the newest versions of the master branch from each of the library repositories, we found the detector would read images as having dimensions of 0 by 0, an error remedied by pulling a different branch suggested by the vendor. Make sure to utilize the correct versions of the library when compiling. 


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


### Legacy INSTALL-EPICS

To build the liblambda for use with EPICS areaDetector, perform the following commands from within the
LambdaSuppport directory:

#create directories from the build information
mkdir liblambda-build
mkdir liblambda-linux-x86_64
#change directory to the build directory
cd liblambda-build
cmake -DCMAKE_INSTALL_PREFIX=../liblambda-linux-x86_64 ../liblambda
#Build the code
make
#Install into liblambda-<EpicsHostArch>
make install
# Go back to LambdaSupport
cd ..
# This make will happen as part of areaDetector build, It installs headers
# and libraries in ADLambda/lib, include, etc so that it will be found by EPICS builds.
make




