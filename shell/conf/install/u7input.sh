#!/bin/bash

echo "---------------------update-----------------------"  ;
rm -rf /var/lib/apt/lists/*;
sudo dpkg --configure -a;
sudo apt-get install -f;
sudo apt-get dist-upgrade -y ;
sudo apt-get update -y;
sudo apt-get upgrade -y ;
echo "---------------------ppa-----------------------"  ;
#sudo DEBIAN_FRONTEND=noninteractive apt-get install -y python-software-properties software-properties-common;
echo "---------------------input-----------------------"  ;
#sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes im-config;
#scim
#sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep -y --force-yes scim;
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes scim;
sudo dpkg --configure -a;
sudo apt-get install -f;
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes scim-pinyin scim-tables-zh -y;
#echo "XIM=SCIM XIM_PROGRAM=/usr/bin/scim XIM_ARGS='-d' GTK_IM_MODULE=scim QT_IM_MODULE=scim DEPENDS='scim,scim-gtk2-immodule|scim-qtimm'" >> /etc/X11/xinit/xinput.d/default;
#echo "XIM=SCIM XIM_PROGRAM=/usr/bin/scim XIM_ARGS='-d' GTK_IM_MODULE=scim QT_IM_MODULE=scim DEPENDS='scim,scim-gtk2-immodule|scim-qtimm'" >> /etc/X11/xinit/xinput.d/scim;
#fcitx
#sudo apt-get install build-essential;
#sudo apt-get build-dep fcitx;
#sudo apt-get install fcitx;
#sudo im-switch -s fcitx -z default;
#im-switch -s fcitx -z default;
#fcitx;
echo "---------------------input-----------------------"  ;
