#!/bin/bash

echo "---------------------update-----------------------"  ;
rm -rf /var/lib/apt/lists/*;
sudo dpkg --configure -a;
sudo apt-get install -f;
sudo apt-get dist-upgrade -y ;
sudo apt-get update -y;
sudo apt-get upgrade -y ;
echo "------------------------soft--------------------"  ;
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes python-software-properties software-properties-common;
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --no-install-recommends firefox flashplugin-installer flashplugin-* firefox-locale-zh-hant firefox-locale-zh-hans dosbox putty visualboyadvance visualboyadvance-gtk libreoffice libreoffice-l10n-zh-cn pinta x11vnc;
echo "------------------------Clean--------------------"  ;
sudo apt-get autoremove -y  ;
sudo apt-get clean -y  ;
sudo apt-get autoclean -y  ;
echo "--------------------------------------------"  ;