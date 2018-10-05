TOP=../
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================
#SRC_DIRS += ../liblambda-$(EPICS_HOST_ARCH)/include/lambda
#Built from source includes
#SRC_DIRS += ../liblambda-$(EPICS_HOST_ARCH)/include
#SRC_DIRS += ../libfsdetcore-$(EPICS_HOST_ARCH)/include
#prebuilt includes
<<<<<<< HEAD
SRC_DIRS += ../prebuiltincludes
=======
SRC_DIRS += ../vendorinclude
>>>>>>> 91786984d14af64b41d835b37b7646465f4610af
#INC += DetInterface.h
INC += fsdetector/lambda/Version.h
INC += fsdetector/lambda/LambdaGlobals.h
INC += fsdetector/lambda/LambdaInterface.h
INC += fsdetector/lambda/LambdaSysImpl.h
INC += fsdetector/core/Globals.h
INC += fsdetector/core/NetworkInterface.h
INC += fsdetector/core/NetworkImplementation.h
INC += fsdetector/core/Utils.h
INC += fsdetector/core/FilesOperation.h
INC += fsdetector/core/ThreadUtils.h
INC += fsdetector/core/MemUtils.h
INC += fsdetector/core/Version.h
INC += fsdetector/core/MemUtils.tpp

#=============================
ifeq (linux-x86_64, $(findstring linux-x86_64, $(T_A)))
# the .so files should be links to .1.0 and .0.9 respectively
#LIB_INSTALLS_Linux += ../liblambda-$(EPICS_HOST_ARCH)/lib/liblambda.so
#LIB_INSTALLS_Linux += ../libfsdetcore-$(EPICS_HOST_ARCH)/lib/libfsdetcore.so
#LIB_INSTALLS_Linux += ../liblambda-$(EPICS_HOST_ARCH)/lib/liblambda.so.1.0
#LIB_INSTALLS_Linux += ../libfsdetcore-$(EPICS_HOST_ARCH)/lib/libfsdetcore.so.0.9
<<<<<<< HEAD
LIB_INSTALLS_Linux += ../prebuiltlibs/libfsdetcore.so.0.8
LIB_INSTALLS_Linux += ../prebuiltlibs/liblambda.so.0.9
LIB_INSTALLS_Linux += ../prebuiltlibs/liblambda.so
LIB_INSTALLS_Linux += ../prebuiltlibs/libfsdetcore.so
=======
LIB_INSTALLS_Linux += ../os/$(EPICS_HOST_ARCH)/libfsdetcore.so.0.8
LIB_INSTALLS_Linux += ../os/$(EPICS_HOST_ARCH)/liblambda.so.0.9
LIB_INSTALLS_Linux += ../os/$(EPICS_HOST_ARCH)/liblambda.so
LIB_INSTALLS_Linux += ../os/$(EPICS_HOST_ARCH)/libfsdetcore.so
>>>>>>> 91786984d14af64b41d835b37b7646465f4610af
endif

vpath %.tpp $(USR_VPATH) $(ALL_SRC_DIRS) include 
include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
