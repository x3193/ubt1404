#!/bin/bash

echo "---------------------pre-install-----------------------"  
export DISPLAY=':1' DEBIAN_FRONTEND='noninteractive' HOME='/root' USER='root' AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2' TZ='Asia/Shanghai'; export TZ;dpkg --configure -a && apt-get install -f && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install expect sudo net-tools openssh-server pwgen zip unzip python-numpy python3-numpy cron curl git gparted; mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config; sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y sudo net-tools wget vim zip unzip python-numpy python3-numpy cron curl; 
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
echo "---------------------language-----------------------"  
cd /var/www/html/shell/conf 
sudo echo "TZ='Asia/Shanghai'; export TZ" >> ~/.profile
sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y language-pack-en-base language-pack-en-base ttf-ubuntu-font-family fonts-wqy-microhei
sudo mkdir -vp /usr/share/fonts/xpfonts
cd /var/www/html/shell/conf 
sudo cp -R -f /ttf/*.ttf /usr/share/fonts/xpfonts
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv
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
echo "root:$ROOT_PASS" | chpasswd
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
#sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y novnc websockify openssl xorg ubuntu-gnome-desktop xfce4 xfce4-terminal icewm tightvncserver x11vnc autocutsel git 
sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y novnc websockify openssl xorg icewm xfce4 xfce4-terminal xfce4-taskmanager xfce4-* tightvncserver x11vnc autocutsel git 
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
echo "---------------------tty.js---------------------------"
#nodejs npm
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y --install-recommends nodejs npm
ln -sf /usr/bin/nodejs /usr/bin/node -f
#node-gyp n
sudo npm install -g node-gyp n
node -v
#update npm
#n 4.4.0
sudo n 8.4.0
node -v
npm -v
sudo npm update -g
npm -v
#update node-gyp tty.js n
#sudo npm install -g --unsafe-perm node-gyp
sudo npm install -g tty.js n
#bower
sudo npm install -g bower
sudo bower install --allow-root
#sudo bower search xterm
#set tty.js
cd /var/www/html/shell/conf/node.js/tty.js
sudo cp -R -f tty.js .tty.js /usr/local/lib/node_modules/tty.js
cd /usr/local/lib/node_modules/tty.js
#openssl req -x509 -newkey rsa:2048 -keyout ./key.pem -out ./cert.pem -days 36500 -nodes
cd /var/www/html/shell/conf/vncserver
sudo cp -f key.pem cert.pem /usr/local/lib/node_modules/tty.js
a2enmod proxy proxy_ajp proxy_balancer proxy_connect proxy_ftp proxy_http
#sed -i "s/<\/proxy>.*/<\/proxy>\r\nProxyPass \/tty\.js\/ http\:\/\/localhost\:8000\/  \r\nProxyPassReverse \/tty\.js\/ http\:\/\/localhost\:8000\/\r\n/g" /etc/apache2/sites-available/000-default.conf;
#
cd /usr/local/lib/node_modules/node-gyp
sudo npm install
ln -sf /usr/local/lib/node_modules /root/node.js -f
sudo mkdir -vp /var/www/html/tty.js
#sed -i "s/#setsid node/setsid node/g" /root/.vnc/xstartup
#sudo npm update -g
#sudo npm search xterm
#npm config get prefix
#
echo "---------------------pip------------20161201---------------"
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y --install-recommends python-pip build-essential python-dev uget
#pip -i http://pypi.douban.com/simple install Flask
#mkdir -vp /root/.pip
#echo "
#[global]
#trusted-host =  pypi.douban.com
#index-url = http://pypi.douban.com/simple
#" > /root/.pip/pip.conf
#cronen
pip install cronen
cd /var/www/html/shell/conf/cronen
#sudo find /var/www/html/shell/conf/cronen/* -name cronen-master.zip -delete
#curl -o cronen-master.zip https://codeload.github.com/x3193/cronen/zip/master
unzip -o -d /var/www/html/ cronen-master.zip
python /var/www/html/cronen-master/setup.py install
cp -R -f cron.py /var/www/html/cronen-master
echo "---------------------download---------------------------"
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y --install-recommends uget aria2
echo "------------------------update--------------------" 
echo "CHROMIUM_FLAGS='--user-data-dir --no-sandbox'" >> /etc/chromium-browser/default
#dos2unix
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y dos2unix
find /var/www/html/shell -name "*" -exec dos2unix {} \;
# 
df -h
echo "------------------------Clean--------------------"  
sudo apt-get autoremove -y  
sudo apt-get clean -y  
sudo apt-get autoclean -y  
echo "--------------------------------------------"  
