#!/bin/bash

echo "---------------------pre-install-----------------------"  
export DISPLAY=':1' DEBIAN_FRONTEND='noninteractive' HOME='/root' USER='root' AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2' TZ='Asia/Shanghai'; export TZ;dpkg --configure -a && apt-get install -f && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install expect sudo net-tools openssh-server pwgen zip unzip python-numpy python3-numpy cron curl git gparted; mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config; sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y sudo net-tools wget vim zip unzip python-numpy python3-numpy cron curl lxtask; 
#sudo rm -rf /.root_pw_set
mkdir -vp /var/www/html/shell
chmod -R 7777 /var/www/html
sudo cp -R -f /root/shell/* /var/www/html/shell
sudo cp -R -f /var/www/html/shell/loader/ops-run.sh /
echo "-----------------------configure-----------------------"
sudo dpkg --add-architecture i386
sudo dpkg --configure -a
sudo dpkg-reconfigure -p high -f noninteractive debconf 
sudo chmod -R 7777 /var/www/html/shell/conf 
#cat /proc/version
#uname -a
#lsb_release -a
echo "---------------------souce.list--------a---------------"  
cd /var/www/html/shell/conf/source
sudo cp -R -f /etc/apt/sources.list /etc/apt/sources.list.backup
if [ $1 = "trusty" ] || [ -z "$1" ] ; then
	sudo cp -R -f sources.list /etc/apt/sources.list
fi
if [ $1 = "xenial" ]; then
	sudo cp -R -f sources.list.xenial /etc/apt/sources.list
fi
if [ $1 = "utopic" ]; then
	sudo cp -R -f sources.list.utopic /etc/apt/sources.list
fi

#
sudo apt-get update --force-yes  -y
# add-apt-repository
sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y python-software-properties software-properties-common
sudo rm -rf -R /var/lib/apt/lists/*
sudo dpkg --add-architecture i386
sudo dpkg --configure -a
sudo dpkg-reconfigure -p high -f noninteractive debconf 
sudo apt-get install -f
sudo apt-get update --force-yes  -y
#sudo apt-get upgrade --force-yes  -y 
#sudo apt-get dist-upgrade --force-yes  -y
sudo apt-get autoremove -y  
sudo apt-get clean -y  
sudo apt-get autoclean -y 
echo "---------------------------SSH-----------------"  
cd /var/www/html/shell/conf 
sudo rm -rf ~/.ssh
mkdir -vp ~/.ssh
#ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ""
ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""
cd /var/www/html/shell/conf/.ssh 
sudo cp -R -f known_hosts id_rsa.pub id_rsa authorized_keys default.ppk ~/.ssh 
sudo chmod -R 0600 ~/.ssh 
sudo chmod 0700 ~ 
sudo chmod 0700 ~/.ssh 
sudo chmod 0644 ~/.ssh/authorized_keys 
sudo mkdir -vp ~/ssh
sudo cp -R -f ~/.ssh/* ~/ssh
cd /var/www/html/shell/conf/ssh 
sudo cp -R -f ssh /etc/init.d 
echo "================================================="
echo "root:EUIfgwe7" | chpasswd
#sudo service ssh start 
echo "================================================="
echo "---------------------crontab-----------------------"  
cd /var/www/html/shell/conf/cron
sudo cp -R -f crontab /etc 
#sed -i "s/\#\*\/1 \* \* \* \*/\*\/1 \* \* \* \*/g" /etc/crontab;
#sudo cp -R -f cron_hourly.sh /etc/cron.hourly 
#sudo cp -R -f cron_daily.sh /etc/cron.daily 
echo "================================================="
#sudo /etc/init.d/cron restart 
#sudo cron  
#sudo /etc/init.d/cron restart 
echo "================================================="
echo "--------------------VNC------------------------"  
export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
#sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y novnc websockify openssl xorg ubuntu-gnome-desktop xfce4 icewm lxde tightvncserver x11vnc autocutsel git 
if [ $1 = "trusty" ] || [ -z "$1" ] ; then
	sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y novnc websockify openssl xorg xfce4 icewm lxde tightvncserver x11vnc autocutsel git 
fi
if [ $1 = "xenial" ]; then
	sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y novnc websockify openssl xorg icewm lxde tightvncserver x11vnc autocutsel git 
fi
##openssl req -x509 -nodes -newkey rsa:2048 -keyout /root/novnc.pem -out /root/novnc.pem -days 36500
cd /var/www/html/shell/conf/vncserver
sudo chmod -R 7777 /var/www/html/shell/conf
#sudo find /var/www/html/shell/conf/* -name noVNC-master.zip -delete 
#sudo wget -O noVNC-master.zip https://codeload.github.com/x3193/noVNC/zip/master
sudo mkdir -vp /var/www/html
sudo chmod -R 7777 /var/www/html
sudo unzip -o -d /var/www/html/ noVNC-master.zip
sudo chmod -R 7777 /var/www/html
sudo unzip -o -d /var/www/html/noVNC-master/utils websockify.zip
sudo cp -f novnc.pem /root
sudo ln -s /usr/share/novnc /var/www/html
sudo mkdir -vp /root/.vnc
sudo chmod -R 7777 /root/.vnc
cd /var/www/html/shell/conf/vncserver 
sudo cp -R -f passwd xstartup /root/.vnc 
sudo chmod -R 0600 /root/.vnc/passwd
tightvncserver :1
DISPLAY=:1 sudo add-apt-repository ppa:ondrej/php -y
#DISPLAY=:1 sudo add-apt-repository ppa:malcscott/shellinabox -y
#DISPLAY=:1 sudo add-apt-repository ppa:chris-lea/node.js -y
tightvncserver -kill :1
echo "================================================="
if [ -z "$1" ]; then
 tightvncserver -kill :1
 tightvncserver :1
 websockify -D --web=/usr/share/novnc/ --cert=/root/novnc.pem 6080 localhost:5901 & 
 #setsid /var/www/html/noVNC-master/utils/launch.sh --vnc localhost:5901 & 
fi 
echo "================================================="
echo "------------------------rarlinux--------------------" 
cd /var/www/html/shell/conf/
sudo mkdir -vp /var/www/html/shell/conf/rarlinux
cd /var/www/html/shell/conf/rarlinux
#sudo curl -o rarlinux-x64-5.3.0.tar.gz  http://www.rarsoft.com/rar/rarlinux-x64-5.3.0.tar.gz
sudo tar xvfz rarlinux-x64-5.3.0.tar.gz 
cd /var/www/html/shell/conf/rarlinux/rar
sudo mkdir -vp /usr/local/bin
sudo mkdir -vp /usr/local/lib
sudo cp -R -f rar unrar /usr/local/bin
sudo cp -R -f rarfiles.lst /etc
sudo cp -R -f default.sfx /usr/local/lib
echo "--------------------USER--------------------------------" 
adduser --shell /bin/bash --system --ingroup root --force-badname --uid 1001 x3193
echo "x3193 ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
tightvncserver :1
DISPLAY=:1 PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
DISPLAY=:1 echo "x3193:$PASS" | chpasswd
DISPLAY=:1 echo "www-data:$PASS" | chpasswd
tightvncserver -kill :1
echo "------------------------update--------------------" 
echo "CHROMIUM_FLAGS='--user-data-dir --no-sandbox'" >> /etc/chromium-browser/default 
df -h
echo "------------------------Clean--------------------"  
sudo apt-get autoremove -y  
sudo apt-get clean -y  
sudo apt-get autoclean -y  
echo "--------------------------------------------"  
