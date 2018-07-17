#!/bin/bash
# Script that can be used to make the required vendor libraries for the ADLambda driver
# NOTE: when updating the driver to work with new versions of liblambda/libfsdetcore,
#	the newest version of the code on bitbucket was not compatible. Make sure to
#	ask the vendor which version needs to be pulled for your specific detector

URL_LIBFSDETCORE=https://stash.desy.de/rest/api/latest/projects/FSDSDET/repos/libfsdetcore/archive?format=zip
#URL_LIBLAMBDA=https://stash.desy.de/rest/api/latest/projects/FSDSDET/repos/liblambda/archive?at=refs%2Fheads%2Ffeature%2Fmerged750k60k&format=zip
URL_LIBLAMBDA=https://stash.desy.de/rest/api/latest/projects/FSDSDET/repos/liblambda/archive?format=zip
DETCORE_MANUAL="NO"
LAMBDA_MANUAL="NO"
LAMBDA_SUPPORT=$(pwd)

if [ "$DETCORE_MANUAL" = "NO" ]
then
	echo "Downloading zip of master branch of detcore"
	mkdir libfsdetcore
	cd libfsdetcore
	curl $URL_LIBFSDETCORE -o libfsdetcore.zip
	unzip libfsdetcore.zip
	rm libfsdetcore.zip
	cd ..
else
	cd libfsdetcore
	unzip libfsdetcore.zip
	rm libfsdetcore.zip
	cd ..
fi

if [ "$LAMBDA_MANUAL" = "NO" ]
then
	mkdir liblambda
	cd liblambda
	curl $URL_LIBLAMBDA -o liblambda.zip
	unzip liblambda.zip
	rm liblambda.zip
	cd ..
else
	cd liblambda
	unzip liblambda.zip
	rm liblambda.zip
	cd ..
fi

echo "Create necessary directories"
mkdir liblambda-build
mkdir libfsdetcore-build
mkdir liblambda-linux-x86_64
mkdir libfsdetcore-linux-x86_64

echo  "Configure, make and install libfsdetcore"
cd libfsdetcore-build
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=../libfsdetcore-linux-x86_64 ../libfsdetcore
make
make install
export PKG_CONFIG_PATH=$LAMBDA_SUPPORT/libfsdetcore-linux-x86_64/lib/pkgconfig
cd ..

export LD_LIBRARY_PATH=$LAMBDA_SUPPORT/libfsdetcore-linux-x86_64/lib

echo "Configure, make and install liblambda"
cd liblambda-build
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=../liblambda-linux-x86_64 ../liblambda
make
make install
#export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/epics/support/areaDetector-3-3/ADLambda/LambdaSupport/liblambda-linux-x86_64/lib/pkgconfig
cd ..

echo "Finished Build, moving libraries"

rm os/linux-x86_64/*
cp libfsdetcore-linux-x86_64/lib/lib* os/linux-x86_64/.
cp liblambda-linux-x86_64/lib/lib* os/linux-x86_64/.
rm -rf vendorinclude/fsdetector/*
cp -r libfsdetcore-linux-x86_64/include/fsdetector/core vendorinclude/fsdetector/.
cp -r liblambda-linux-x86_64/include/fsdetector/lambda vendorinclude/fsdetector/.

# Optionally remove all build+source folders
rm -rf lib*

#export LD_LIBRARY_PATH=$LAMBDA_SUPPORT/os/linux-x86_64

echo "Finished. Ready to make ADLambda"
