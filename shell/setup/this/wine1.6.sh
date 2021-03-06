#!/bin/bash

echo "---------------------wine-----------------------" 
#
sudo rm -rf -R /var/lib/apt/lists/*
sudo dpkg --add-architecture i386
sudo dpkg --configure -a
sudo dpkg-reconfigure -p high -f noninteractive debconf 
sudo apt-get install -f
sudo apt-get update --force-yes  -y
sudo apt-get upgrade --force-yes  -y 
sudo apt-get dist-upgrade --force-yes  -y
#
sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep --install-recommends --force-yes -y wine1.6
sudo dpkg --add-architecture i386
sudo dpkg --configure -a
sudo dpkg-reconfigure -p high -f noninteractive debconf 
sudo apt-get install -f
sudo apt-get update --force-yes  -y
sudo apt-get upgrade --force-yes  -y 
sudo apt-get dist-upgrade --force-yes  -y 
sudo apt-get autoremove -y  
sudo apt-get clean -y  
sudo apt-get autoclean -y 
dpkg --print-architecture
dpkg --print-foreign-architectures
sudo dpkg --add-architecture i386
sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep --install-recommends --force-yes -y wine1.6
sudo dpkg --add-architecture i386
sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y wine1.6
# wine32
#sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep --install-recommends --force-yes -y q4wine
sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y q4wine
#env WINEARCH=win32 WINEPREFIX=~/.wine winecfg
#env WINEARCH=win64 WINEPREFIX=~/.wine64 winecfg
#
echo "------------------------Clean--------------------"  
sudo apt-get autoremove -y  
sudo apt-get clean -y  
sudo apt-get autoclean -y  
echo "--------------------------------------------" 