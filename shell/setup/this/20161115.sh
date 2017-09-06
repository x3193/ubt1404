#!/bin/bash

tightvncserver :1
echo "========================20161115========================"
dpkg --configure -a 
apt-get install -f 
apt-get update  -y
DEBIAN_FRONTEND=noninteractive apt-get -y --force-yes install expect sudo net-tools openssh-server pwgen zip unzip python-numpy python3-numpy cron curl gnome-schedule lxtask
echo "------------------------sudoers--------------------"
sudo sed -i "s/www-data ALL=(ALL) NOPASSWD: ALL.*//g" /etc/sudoers
sudo sed -i "s/Defaults visiblepw.*//g" /etc/sudoers
echo "www-data ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "Defaults visiblepw" >> /etc/sudoers
echo "--------------------USER--------------------------------" 
adduser --shell /bin/bash --system --ingroup root --force-badname --uid 1001 x3193
echo "x3193 ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
echo "x3193:$PASS" | chpasswd
echo "www-data:$PASS" | chpasswd
echo "---------------------sources.list-------------------"
echo "

deb http://cn.archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse
deb http://cn.archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://cn.archive.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://cn.archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://cn.archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://cn.archive.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse

deb http://security.ubuntu.com/ubuntu trusty main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse
deb-src http://security.ubuntu.com/ubuntu trusty main restricted universe multiverse
deb-src http://security.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse
deb-src http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse

" >> /etc/apt/sources.list

sudo add-apt-repository ppa:ondrej/php -y
sudo add-apt-repository ppa:malcscott/shellinabox -y
sudo add-apt-repository ppa:chris-lea/node.js -y
echo "---------------------------php7.0-----------------" 
sudo apt-get update -y
apt-cache search php7
#sudo DEBIAN_FRONTEND=noninteractive apt-get remove libapache2-mod-php5 php5-* phpmyadmin -y;
#sudo apt-get autoremove -y  
#sudo apt-get clean -y  
#sudo apt-get autoclean -y 
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --install-recommends libapache2-mod-php7.0 php7.0-curl;
sudo a2dismod php5
sudo a2enmod php7.0
sudo service apache2 restart;
sudo a2dismod php7.0
sudo a2enmod php5
sudo service apache2 restart;
#exit
echo "---------------------ajaxterm-----------------------"  
sudo apt-get install ajaxterm -y
echo "setsid ajaxterm" >> /var/www/html/shell/loader/this/vnc.sh
sudo sed -i "s/PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config;
sudo service ssh start;
sudo a2enmod proxy_http;
sed -i "s/Listen 80/Listen 80 \r\nListen 8022/g" /etc/apache2/ports.conf;
sed -i "s/<\/VirtualHost>.*/<\/VirtualHost>\r\n\r\n<VirtualHost \*\:8022>\r\nProxyRequests Off\r\n<proxy *>\r\nOrder allow\,deny\r\nAllow from all\r\n<\/proxy>\r\nProxyPass \/ http\:\/\/localhost\:8022\/  \r\nProxyPassReverse \/ http\:\/\/localhost\:8022\/\r\n<\/VirtualHost>/g" /etc/apache2/sites-available/000-default.conf;
sed -i "s/ServerName www-x3193.myalauda.cn.*/ServerName localhost/g" /etc/apache2/sites-available/000-default.conf;
cat /etc/apache2/ports.conf;
cat /etc/apache2/sites-available/000-default.conf;
sudo service apache2 restart;
echo "--------------------shellinabox-------------------------"
#sudo add-apt-repository ppa:malcscott/shellinabox -y
#sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y shellinabox
echo "---------------------tty.js---------------------------"
#sudo add-apt-repository ppa:chris-lea/node.js -y
sudo apt-get install nodejs  --force-yes -y
#sudo npm search xterm
sudo npm install tty.js -g
cd /var/www/html/shell/conf/node.js/tty.js
sudo cp -R -f tty.js .tty.js /usr/lib/node_modules/tty.js
#sudo ln -s /usr/lib/node_modules/tty.js /root/node.js
echo "----------------------------------------------------" 

##echo "--------------------kernel------------------------------" 
##sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y linux-cloud-tools-`uname -r` linux-headers-`uname -r` linux-image-`uname -r` linux-image-extra-`uname -r` linux-signed-image-`uname -r` linux-tools-`uname -r`
##sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y grub virtualbox
##sudo update-grub
##sudo /etc/init.d/virtualbox restart
##echo "---------------------docker----------------------"  
##curl -sSL https://get.daocloud.io/docker | sh
##curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://fc180fb3.m.daocloud.io
##sudo /usr/local/bin/dockerd
##echo "---------------------ide----------------------" 
##sudo mkdir -vp /root/c9sdk
##cd /root/c9sdk
##git clone git://github.com/c9/core.git
##cd core
##scripts/install-sdk.sh
echo "---------------------node.js---------------------------"
#sudo add-apt-repository ppa:chris-lea/node.js -y
#sudo apt-get update -y
#sudo apt-get install nodejs -y
#sudo npm search xterm
#
#wget https://nodejs.org/download/release/v0.12.10/node-v0.12.10-linux-x86.tar.gz
#wget https://nodejs.org/dist/v4.2.6/node-v4.2.6-linux-x64.tar.xz
#tar xvf node-v4.2.6-linux-x64.tar.xz
#cd node-v4.2.6-linux-x64
#sudo ln -s ~/node-v4.2.6-linux-x64/bin/node /usr/local/bin/node -f
#sudo ln -s ~/node-v4.2.6-linux-x64/bin/npm /usr/local/bin/npm -f
#
#curl https://www.npmjs.com/install.sh | sudo sh
#
#sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends nodejs
#sudo npm update -g
#sudo npm install -g n
#sudo n stable
##n latest
#sudo npm update -g
#sudo npm install -g node-gyp n
#
echo "------------------------Clean--------------------"  
sudo apt-get autoremove -y  
sudo apt-get clean -y  
sudo apt-get autoclean -y  
echo "-------------------------------------------------"  
tightvncserver -kill :1