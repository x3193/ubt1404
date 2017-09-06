#!/bin/bash

echo "--------------------WINE1.6/8------------------------"  ;
cd ~;
sudo dpkg --configure -a  >> ~/install.log;
sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep -f -y --force-yes --no-install-recommends wine1.6  >> ~/install.log;
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --no-install-recommends flex bison qt4-qmake libfreetype6-dev libjpeg-dev libpng-dev libxslt-dev libxml2-dev libxrender-dev libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev prelink libasound2-dev  >> ~/install.log;
cd ~;
wget http://nchc.dl.sourceforge.net/project/wine/Source/wine-1.6.2.tar.bz2  >> ~/install.log;
#wget http://dl.winehq.org/wine/source/1.8/wine-1.8-rc4.tar.bz2;
#wget https://dl.winehq.org/wine/source/1.7/wine-1.7.55.tar.bz2;
tar -xjvf wine-1.6.2.tar.bz2 && cd wine-1.6.*  >> ~/install.log;
#tar -xjvf wine-1.8-rc4.tar.bz2 && cd wine-1.8*;
#tar -xjvf wine-1.7.55.tar.bz2 && cd wine-1.7.*;
./configure --enable-win64  >> ~/install.log;
make  >> ~/install.log;
make install  >> ~/install.log;
sudo ln -s /usr/local/bin/wine64 /usr/local/bin/wine  >> ~/install.log;
echo "--------------------WINE1.6/8------------------------"  ;