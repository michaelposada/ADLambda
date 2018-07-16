# Building vendor code manually


If you choose to not use the vendor.sh script to compile vendor code automatically, a manual install is still possible.

First, download and unpack the zip archives of the vendor source.
Download liblambda into a folder liblambda and unpack it there, and libfsdetcore for libfsdetcore

Next, run the following commands:

```
mkdir libfsdetcore-build
mkdir libfsdetcore-linux-x86_64
```
This will create our directory structure.

```
cd libfsdetcore-build
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=../libfsdetcore-linux-x86_64 ../libfsdetcore
make
make install
```
This will build and compile libfsdetcore

```
export PKG_CONFIG_PATH=$(PATH_TO_ADLAMBDA)/LambdaSupport/libfsdetcore-linux-x86_64/lib/pkgconfig
cd ..
```
This will add libfsdetcore to your package config path.

```
mkdir liblambda-build
mkdir liblambda-linux-x86_64
```
This will create our directory structure.

```
cd liblambda-build
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=../liblambda-linux-x86_64 ../liblambda
make
make install
```
This will build and compile liblambda

Next, enter the liblambda-linux-x86_64 and libfsdetcore-linux-x86_64 directories created by the script, and copy the
generated libraries into ./os/linux-x86_64, replacing the ones currently there, and copy the include files into
the ./vendorinclude/fsdetector directory, also replacing the lambda and core folders with the new ones.

From here, alter the Makefile in this directory to include the new libraries, and add any updated/changed
header files.

You will also need to set the library path as described in README.md

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




