#!/bin/bash

echo "Remember! Run this in root directory of the Electron folder (Next to the Electron executable)"
echo "Remember! Make sure you you deleted the example Electron resources and copied the projectFLY resources"

echo "----"

echo "Extracting projectFLY asar"
cd ./resources
asar extract ./app.asar ./app
cd ../

echo "----"

echo "Downloading Open projecFLY X-Plane plugin"
cd ./resources/exec/xpl
wget https://gitlab.com/pretzelca/open-projectfly-x-plane/uploads/75c1855ccb46ad0ad5a80d3e80dd5621/openPFly.tar.xz
echo "Extracting plugin"
tar -xf openPFly.tar.xz
cd ../../../

echo "----"

echo "Downloading patch"
wget https://gitlab.com/pretzelca/projectfly-for-linux/-/raw/master/pflylinux.patch
echo "Applying patch"
echo "If the patching process requires you to enter input, just enter Y for both of them"
cd ./resources/app
patch < ../../pflylinux.patch
cd ../../

echo "----"

echo "Cleaning up"

rm pflylinux.patch
cd ./resources/exec/xpl
rm openPFly.tar.xz

echo "----"

echo "Complete!"
