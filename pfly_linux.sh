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
wget https://gitlab.com/pretzelca/open-projectfly-x-plane/-/raw/master/openPFly.tar.xz
echo "Extracting plugin"
tar -xf openPFly.tar.xz
cd ../../../

echo "----"

echo "Downloading patch"
wget https://gitlab.com/pretzelca/projectfly-for-linux/-/raw/master/pflylinux.patch
echo "Applying patch"
dos2unix ./resources/app/main.js
dos2unix ./pflylinux.patch
cd ./resources/app
patch -p1 < ../../pflylinux.patch
cd ../../

echo "----"

echo "Cleaning up"

rm pflylinux.patch
cd ./resources/exec/xpl
rm openPFly.tar.xz

echo "----"

echo "Complete!"
