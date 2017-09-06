#!/bin/bash

echo "---------------------pre-install-----------------------"  
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --no-install-recommends wget vim zip unzip python-numpy python3-numpy
echo "-----------------------configure---------------------"  
sudo dpkg --configure -a
sudo chmod -R 7777 /root/shell/conf 
echo "---------------------souce.list-----------------------"  
cd /root/shell/conf/source
sudo cp -f /etc/apt/sources.list /etc/apt/sources.list.backup
sudo cp -f sources.list /etc/apt
rm -rf -R /var/lib/apt/lists/*
sudo dpkg --configure -a
sudo apt-get install -f
sudo apt-get dist-upgrade -y 
sudo apt-get update -y
sudo apt-get upgrade -y 
echo "---------------------zh-cn-----------------------"  
cd /root/shell/conf 
sudo echo "export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'" >> ~/.profile
sudo echo "export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'" >> /etc/profile
sudo echo "TZ='Asia/Shanghai'; export TZ" >> ~/.profile
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --install-recommends language-pack-zh-hant language-pack-zh-hans language-pack-zh-hans-base language-pack-zh-hant-base language-pack-gnome-zh-hant ttf-ubuntu-font-family fonts-wqy-microhei
sudo mkdir -vp /usr/share/fonts/xpfonts
cd /root/shell/conf 
sudo cp -f /ttf/*.ttf /usr/share/fonts/xpfonts
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv
echo "---------------------input-----------------------"  
export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes scim
sudo dpkg --configure -a
sudo apt-get install -f
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes scim-pinyin scim-tables-zh -y
echo "---------------------------SSH-----------------"  
cd /root/shell/conf 
sudo rm -rf ~/.ssh
#ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ""
ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""
cd /root/shell/conf/.ssh  
sudo cp -f known_hosts id_rsa.pub id_rsa authorized_keys default.ppk ~/.ssh 
sudo chmod -R 0600 ~/.ssh 
sudo chmod 0700 ~ 
sudo chmod 0700 ~/.ssh 
sudo chmod 0644 ~/.ssh/authorized_keys 
sudo mkdir -vp ~/ssh
sudo cp -f ~/.ssh/* ~/ssh
cd /root/shell/conf/ssh 
sudo cp -f ssh /etc/init.d 
echo "================================================="
sudo service ssh start 
echo "================================================="
echo "---------------------crontab-----------------------"  
cd /root/shell/conf/cron 
sudo cp -f crontab /etc 
sudo cp -f cron_hourly.sh /etc/cron.hourly 
sudo cp -f cron_daily.sh /etc/cron.daily 
echo "================================================="
sudo /etc/init.d/cron restart 
sudo cron  
sudo /etc/init.d/cron restart 
echo "================================================="
echo "---------------------proxy-----------------------" 
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes proxychains expect dnsutils
#sudo echo "socks5 127.0.0.1 9999" >> /etc/proxychains.conf
cd /root/shell/conf/Proxychains
sudo mkdir -vp /root/Desktop/Proxychains
sudo cp -f *.desktop /root/Desktop/Proxychains
sudo cp -f proxychains.conf /etc
echo "--------------------VNC------------------------"  
export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
#sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep -y --force-yes xorg lxde tightvncserver gtk2-engines-murrine autocutsel git
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --install-recommends xorg lxde tightvncserver x11vnc autocutsel git
echo "CHROMIUM_FLAGS='--user-data-dir'" >> /etc/chromium-browser/default
cd /root/shell/conf/vncserver
sudo chmod -R 7777 /root/shell/conf 
sudo find /root/shell/conf/* -name noVNC-master.zip -delete 
sudo wget -O noVNC-master.zip https://codeload.github.com/kanaka/noVNC/zip/master
sudo mkdir -vp /var/www/html
sudo chmod -R 7777 /var/www/html
sudo unzip -o -d /var/www/html/ noVNC-master.zip
sudo chmod -R 7777 /var/www/html
sudo unzip -o -d /var/www/html/noVNC-master/utils websockify.zip
sudo mkdir -vp /root/.vnc
sudo chmod -R 7777 /root/.vnc
cd /root/shell/conf/vncserver 
sudo cp -f passwd xstartup /root/.vnc 
sudo chmod -R 0600 /root/.vnc/passwd
#setsid autocutsel &
echo "================================================="
if [ -z "$1"]; then
 tightvncserver -kill :1
 tightvncserver :1
 setsid /var/www/html/noVNC-master/utils/launch.sh --vnc localhost:5901 & 
fi 
echo "================================================="
echo "--------------------WINE1.6/8------------------------"  
sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep -y --force-yes --install-recommends wine1.6
sudo dpkg --add-architecture i386
sudo dpkg --configure -a
sudo apt-get install -f
sudo apt-get dist-upgrade -y 
sudo apt-get update -y
sudo apt-get upgrade -y 
dpkg --print-architecture
dpkg --print-foreign-architectures
sudo dpkg --add-architecture i386
sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep -y --force-yes --install-recommends wine1.6
sudo dpkg --add-architecture i386
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --install-recommends wine1.6
# wine32
#sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep -y --force-yes --install-recommends q4wine
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --install-recommends q4wine
#env WINEARCH=win32 WINEPREFIX=~/.wine winecfg
#env WINEARCH=win64 WINEPREFIX=~/.wine64 winecfg
echo "------------------------soft--------------------"  
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes python-software-properties software-properties-common
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --no-install-recommends firefox flashplugin-installer firefox-locale-zh-hant firefox-locale-zh-hans putty filezilla* dosbox putty visualboyadvance visualboyadvance-gtk libreoffice libreoffice-l10n-zh-cn pinta htop aptitude locate xchm curl fceux zsnes
echo "------------------------rarlinux--------------------" 
cd /root/shell/conf/
sudo mkdir -vp /root/shell/conf/rarlinux
cd /root/shell/conf/rarlinux
sudo curl -o rarlinux-x64-5.3.0.tar.gz  http://www.rarsoft.com/rar/rarlinux-x64-5.3.0.tar.gz
sudo tar xvfz rarlinux-x64-5.3.0.tar.gz 
cd /root/shell/conf/rarlinux/rar
sudo mkdir -vp /usr/local/bin
sudo mkdir -vp /usr/local/lib
sudo cp -f rar unrar /usr/local/bin
sudo cp -f rarfiles.lst /etc
sudo cp -f default.sfx /usr/local/lib
echo "------------------------rarlinux--------------------" 
echo "------------------------Clean--------------------"  
sudo apt-get autoremove -y  
sudo apt-get clean -y  
sudo apt-get autoclean -y  
echo "--------------------------------------------"  

