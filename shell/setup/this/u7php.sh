#!/bin/bash

echo "---------------------update-----------------------"  ;
rm -rf /var/lib/apt/lists/*;
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
echo "---------------------------php-----------------"  
#
tightvncserver :1
 DISPLAY=':1' export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
 DISPLAY=':1' export DISPLAY=':1' DEBIAN_FRONTEND='noninteractive' HOME='/root' USER='root' AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2' 
 DISPLAY=':1' TZ='Asia/Shanghai'; export TZ 
if [ $1 = "trusty" ] || [ -z "$1" ] ; then
 if [ $2 = 'mysql5.5' ]; then
  #sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep -y firefox putty htop unrar-free zip unzip git wget vim supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen php-apc php5-mcrypt php5-gd php5-curl php5-xdebug phpmyadmin -y  
  DISPLAY=:1 sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y zip unzip git wget vim supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen php-apc php5-mcrypt php5-gd php5-curl php5-dev phpmyadmin gnome-schedule
 fi
 if [ $2 = 'mysql5.6' ]; then
  #sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep -y firefox putty htop unrar-free zip unzip git wget vim supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen php-apc php5-mcrypt php5-gd php5-curl php5-xdebug phpmyadmin -y  
  DISPLAY=:1 sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y zip unzip git wget vim supervisor git apache2 libapache2-mod-php5 mysql-server-5.6 mysql-client-core-5.6 mysql-client-5.6 mysql-client-core-5.6 mysql-client-core-5.6 php5-mysql pwgen php-apc php5-mcrypt php5-gd php5-curl php5-dev phpmyadmin gnome-schedule
 fi 
fi
if [ $1 = "xenial" ]; then
 #sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep -y firefox putty htop unrar-free zip unzip git wget vim supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen php-apc php5-mcrypt php5-gd php5-curl php5-xdebug phpmyadmin -y  
 DISPLAY=:1 sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y zip unzip git wget vim supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen php-apcu php5-mcrypt php5-gd php5-curl php5-dev phpmyadmin 
fi
if [ $1 = "utopic" ] || [ -z "$1" ] ; then
 #sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep -y firefox putty htop unrar-free zip unzip git wget vim supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen php-apc php5-mcrypt php5-gd php5-curl php5-xdebug phpmyadmin -y  
 DISPLAY=:1 sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y zip unzip git wget vim supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen php-apc php5-mcrypt php5-gd php5-curl php5-dev phpmyadmin
fi
tightvncserver -kill :1
#
sudo service apache2 restart  
sudo service mysql restart  
sudo cp -f -R /etc/php5/apache2/php.ini /etc/php5/apache2/php.ini.backup
sudo rm -rf /etc/php5/apache2/php.ini
#sudo cp -f -R /var/www/html/shell/conf/php/php.ini /etc/php5/apache2
sudo ln -sf /var/www/html/shell/conf/php/php.ini /etc/php5/apache2
#sed -i "s/;opcache.enable=.*/opcache.enable=1/g" /etc/php5/apache2/php.ini
sudo php5enmod opcache ;
sudo php5enmod mcrypt ;
sudo a2enmod headers expires
echo "ServerName localhost" >> /etc/apache2/apache2.conf 
chmod -R 7777 /var/www/html 
sudo a2enmod rewrite
sudo /etc/init.d/apache2 restart 
#
tightvncserver :1
DISPLAY=:1 sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y --install-recommends libapache2-mod-php7.0 php7.0-curl php7.0-gd php7.0-xml php7.0-mbstring php7.0-mysql php7.0-json php7.0-zip php7.0-mcrypt
tightvncserver -kill :1
#
sudo a2dismod php5
sudo a2enmod php7.0
sudo service apache2 restart;
sudo service mysql restart;
sudo a2dismod php7.0
sudo a2enmod php5
sudo service apache2 restart;
sudo service mysql restart;
#
echo "---------------------filemanager-----------------------"  
sudo chmod -R 7777 /var/www/html 
sudo find /var/www/html -name index.html -delete 
cd /var/www/html/shell/conf/php 
sudo cp -f .htaccess filebox.php diy.php index.php /var/www/html 
cd /var/www/html/shell/conf/dns
sudo cp -f 000-default.conf /etc/apache2/sites-available  
sudo service apache2 restart  
#sudo cp -f /var/www/html/filebox.php /var/www/html/index.php 
echo "--------------------DNS------------------------"  
cd /var/www/html/shell/conf/dns 
sudo mkdir -vp /var/www/html/dz32
sudo chmod -R 7777 /var/www/html/dz32
#sudo cp -f *.*.conf /etc/apache2/sites-available 
#sudo ln -sf /etc/apache2/sites-available/* /etc/apache2/sites-enabled/
#sudo find /etc/apache2/sites-available/ -name '*.conf' -exec sudo ln -sf {} /etc/apache2/sites-enabled/  \;
#sudo find /var/www/html/shell/conf/dns/ -name '*.conf' -exec sudo ln -sf {} /etc/apache2/sites-enabled/  \;
sudo find /var/www/html/shell/conf/dns/ -name '000-default.conf' -exec sudo ln -sf {} /etc/apache2/sites-enabled/  \;
sudo service apache2 restart 
#sed -i "s/<\/VirtualHost>.*/\r\n\r\nProxyRequests Off\r\n<proxy *>\r\nOrder allow\,deny\r\nAllow from all\r\n<\/proxy>\r\n\r\n<\/VirtualHost>/g" /etc/apache2/sites-available/000-default.conf;
echo "--------------------mysql---------------------------"  
cd /var/www/html/shell/conf/mysql 
#sed -i "s/bind-address/#bind-address/g" /etc/mysql/my.cnf
sudo cp -R -f /etc/mysql/my.cnf /etc/mysql/my.cnf.backup
sudo rm -rf /etc/mysql/my.cnf
sudo cp -f my.cnf /etc/mysql
sudo service mysql restart 
cd /var/lib 
sudo tar xvfz /var/www/html/shell/conf/mysql/mysql.tar.gz
#a=`sudo mysql -u root --version`
#b='mysql Ver 14.14 Distrib '
#c="5.5.54";
#echo ${a:${#b}:${#c}+1-3};
tightvncserver :1
if [ $2 != 'mysql5.5' ]; then
 DISPLAY=:1 sudo /usr/bin/mysqladmin -u root --password="$ROOT_PASS" password "$ROOT_PASS"
fi
if [ $2 = 'mysql5.5' ]; then
 DISPLAY=:1 sudo /usr/bin/mysqladmin -u root password "$ROOT_PASS"
fi
tightvncserver -kill :1
sudo service mysql restart
sudo service apache2 restart  
echo "--------------------phpmyadmin-----------------------"  
cd /var/www/html
sudo ln -sf /usr/share/phpmyadmin phpmyadmin 
sudo chmod -R 7777 /usr/share/phpmyadmin 
cd /var/www/html/shell/conf/php
sudo cp -f Config.class.php /usr/share/phpmyadmin/libraries
#sudo cp -f diy.php /usr/share/phpmyadmin 
sudo php5enmod mcrypt
sudo service apache2 restart 
echo "--------------------novnc-----------------------"
cd /var/www/html
sudo cp -f /var/www/html/noVNC-master/vnc.html /var/www/html/noVNC-master/vnc_auto.html
cd /var/www/html/shell/conf/php
sudo chmod -R 7777 /var/www/html/noVNC-master
#rm -rf /var/www/html/noVNC-master/vnc.html
#rm -rf /var/www/html/noVNC-master/vnc_auto.html
sudo cp -f vnc.php /var/www/html/noVNC-master/index.php 
sudo touch /var/www/html/noVNC-master/vnc.html
sudo cp -f /var/www/html/noVNC-master/vnc.html /var/www/html/noVNC-master/vnc_auto.html
cd /var/www/html/shell/conf/php
sudo chmod -R 7777 /var/www/html/novnc
#rm -rf /var/www/html/novnc/vnc.html
#rm -rf /var/www/html/novnc/vnc_auto.html
sudo cp -f vnc.php /var/www/html/novnc/index.php 
cd /var/www/html/shell/conf/vncserver
sudo cp -f novnc.pem /root
chmod -R 7777 /var/www/html
#sed -i "s/<\/proxy>.*/<\/proxy>\r\nProxyPass \/novnc http\:\/\/localhost\:6080\/  \r\nProxyPassReverse \/novnc http\:\/\/localhost\:6080\/\r\n/g" /etc/apache2/sites-available/000-default.conf;
sudo mkdir -vp /home/www-data;
sudo chmod -R 7777 /home/www-data;
sudo cp -R -f /root/.vnc /home/www-data/.vnc;
sudo chmod -R 0600 /home/www-data/.vnc/passwd;
sudo sed -i "s/www-data:x:.*/www-data:x:33:0:www-data:\/home\/www-data:\/bin\/bash/g" /etc/passwd;
tightvncserver :1
DISPLAY=:1 echo "www-data:$ROOT_PASS" | chpasswd
tightvncserver -kill :1
echo "--------------------php-shell-----------------------"  
cd /var/www/html/shell/conf/php
#sudo cp -R -f /etc/sudoers /etc/sudoers.backup
echo "www-data ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "Defaults visiblepw" >> /etc/sudoers
cd /var/www/html/shell/conf/php-shell
sudo chmod -R 7777 /var/www/html/shell/conf 
sudo find /var/www/html/shell/conf/* -name b374k-master.zip -delete 
sudo wget -O b374k-master.zip https://codeload.github.com/x3193/b374k/zip/master
sudo chmod -R 7777 /var/www/html
sudo unzip -o -d /var/www/html/ b374k-master.zip
echo "--------------------USER--------------------------------" 
adduser --shell /bin/bash --system --ingroup root --force-badname --uid 1001 x3193
echo "x3193 ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
tightvncserver :1
DISPLAY=:1 PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
DISPLAY=:1 echo "x3193:$PASS" | chpasswd
DISPLAY=:1 echo "www-data:$PASS" | chpasswd
tightvncserver -kill :1
echo "---------------------tty.js---------------------------"
#
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y --install-recommends nodejs npm
ln -sf /usr/bin/nodejs /usr/bin/node -f
#
sudo npm install --unsafe-perm --verbose -g node-gyp n
node -v
sudo n 4.4.0
node -v
npm -v
sudo npm update -g
npm -v
sudo npm install --unsafe-perm --verbose -g node-gyp
sudo npm install --unsafe-perm --verbose -g tty.js n
#
sudo npm install --unsafe-perm --verbose -g bower
sudo bower install --allow-root
#sudo bower search xterm
#
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
sudo npm install --unsafe-perm --verbose 
ln -sf /usr/local/lib/node_modules /root/node.js -f
sudo mkdir -vp /var/www/html/tty.js
#sed -i "s/#setsid node/setsid node/g" /root/.vnc/xstartup
#sudo npm update -g
#sudo npm search xterm
#npm config get prefix
#
if [ "1" = "2" ]; then
echo "---------------------ajaxterm-----------------------"  
sudo apt-get install ajaxterm -y
echo "setsid ajaxterm" >> /var/www/html/shell/loader/this/vnc.sh
sudo sed -i "s/PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config;
sudo service ssh start;
a2enmod xml2enc proxy* headers
#a2enmod proxy proxy_ajp proxy_balancer proxy_connect proxy_ftp proxy_http
sed -i "s/Listen 80/Listen 80 \r\nListen 8022/g" /etc/apache2/ports.conf;
sed -i "s/<\/VirtualHost>.*/<\/VirtualHost>\r\n\r\n<VirtualHost \*\:8022>\r\nProxyRequests Off\r\n<proxy *>\r\nOrder allow\,deny\r\nAllow from all\r\n<\/proxy>\r\nProxyPass \/ http\:\/\/localhost\:8022\/  \r\nProxyPassReverse \/ http\:\/\/localhost\:8022\/\r\n<\/VirtualHost>/g" /etc/apache2/sites-available/000-default.conf;
#sed -i "s/ServerName www-x3193.myalauda.cn.*/ServerName localhost/g" /etc/apache2/sites-available/000-default.conf;
cat /etc/apache2/ports.conf;
cat /etc/apache2/sites-available/000-default.conf;
sudo service apache2 restart;
sudo mkdir -vp /var/www/html/ajaxterm
echo "--------------------shellinabox-------------------------"
#sudo add-apt-repository ppa:malcscott/shellinabox -y
#sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y shellinabox
echo "---------------------docker----------------------"  
#curl -sSL https://get.daocloud.io/docker | sh
#curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://fc180fb3.m.daocloud.io
#sudo /usr/local/bin/dockerd
echo "--------------------------grub-------------------"  
#sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --install-recommends linux-cloud-tools-`uname -r`-generic linux-headers-`uname -r`-generic linux-image-`uname -r`-generic linux-image-extra-`uname -r`-generic linux-signed-image-`uname -r`-generic linux-tools-`uname -r`-generic 
#sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --install-recommends grub virtualbox
#sudo update-grub
#sudo /etc/init.d/virtualbox restart
echo "------------------------Clean--------------------" 
fi
echo "---------------------c ide---------------------------"
#
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y --install-recommends geany geany* 
#
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y --install-recommends mcu8051ide as31 emu8051 dis51 cycfx2prog
echo "---------------------pip------------20161201---------------"
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y --install-recommends python-pip build-essential python-dev uget
#pip -i http://pypi.douban.com/simple install Flask
#mkdir -vp /root/.pip
#echo "
#[global]
#trusted-host =  pypi.douban.com
#index-url = http://pypi.douban.com/simple
#" > /root/.pip/pip.conf
echo "---------------------nomo---------asp.net------------------"
sudo apt-get install -y mono-xsp mono-xsp2 mono-xsp4 mono-gmcs mono-utils monodevelop monodoc-http libapache2-mod-mono mono-apache-server mono-apache-server2 mono-apache-server4 asp.net-examples
#
echo 'MonoServerPath "/usr/bin/mod-mono-server"' >> /etc/apache2/mods-available/mod_mono_auto.conf
#sed -i 's/MonoServerPath.*/MonoServerPath \"/usr/bin/mod-mono-server2\"/g' /etc/apache2/mods-available/mod_mono_auto.conf
sudo a2dismod mod_mono_auto
sudo a2dismod mod_mono
sudo a2enmod mod_mono_auto
sudo service apache2 restart
#sudo rm /usr/bin/mod-mono-server
#sudo ln -sf /usr/bin/mod-mono-server2 /usr/bin/mod-mono-server
#sudo service apache2 restart
#sudo rm /usr/bin/mod-mono-server
#sudo ln -sf /usr/bin/mod-mono-server4 /usr/bin/mod-mono-server
#sudo service apache2 restart
#
#cd /var/www/html/shell/conf/mono
#sudo cp -Rf mod_mono.conf /etc/apache2/mods-available
mkdir -vp /var/www/html/mono
sudo cp -Rf /usr/share/asp.net-demos/* /var/www/html/mono
cd /var/www/html/shell/conf/mono
sudo cp -Rf aspx /var/www/html/mono
#
echo "---------------------download---------------------------"
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y --install-recommends uget aria2
echo "---------------------nds emulate---------------------------"
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y --install-recommends desmume
echo "---------------------update-----------------------------"
#vnc
cd /var/www/html/shell/conf/vncserver 
sudo cp -R -f passwd xstartup /root/.vnc 
sudo chmod -R 0600 /root/.vnc/passwd
#memory+cache 
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y smem varnish
sudo /etc/init.d/varnish restart
#cPAN+perl+asp
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y libapache-asp-perl libapache2-mod-perl2
#startup
sudo rm -rf /run.sh
sudo rm -rf /set_root_pw.sh
#sudo rm -rf /.root_pw_set
sudo cp -R -f /var/www/html/shell/loader/run.sh /
chmod -R 7777 /var/www/html/shell
#cron+crontab  
cd /var/www/html/shell/conf/cron
sudo cp -R -f crontab /etc
#anacron 
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y anacron
cd /var/www/html/shell/conf/cron
sudo cp -R -f anacrontab /etc
sudo /etc/init.d/anacron start
#anacron 
#sudo DEBIAN_FRONTEND=noninteractive apt-get remove --force-yes -y anacron
#cronen
pip install cronen
cd /var/www/html/shell/conf/cronen
#sudo find /var/www/html/shell/conf/cronen/* -name cronen-master.zip -delete
#curl -o cronen-master.zip https://codeload.github.com/x3193/cronen/zip/master
unzip -o -d /var/www/html/ cronen-master.zip
python /var/www/html/cronen-master/setup.py install
cp -R -f cron.py /var/www/html/cronen-master
#cgi
cd /var/www/html/shell/conf/cgi
cp -R -f serve-cgi-bin.conf /etc/apache2/conf-available
sudo ln -sf /etc/apache2/conf-available/serve-cgi-bin.conf /etc/apache2/conf-enabled/
sudo a2enmod cgi
sudo a2enmod cgid
sudo a2enconf serve-cgi-bin
sudo service apache2 restart
sudo mkdir -vp /var/www/html/cgi
cp -R -f index.cgi v.js /var/www/html/cgi
chmod -R 7777 /var/www/html
#gem+ruby
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y ruby
#enxtend .php=>.x3193
cd /var/www/html/shell/conf/php
cp -R -f php5.conf /etc/apache2/mods-available
sudo a2dismod php7.0
sudo a2enmod php5
sudo service apache2 restart;
cp -R -f index.php /var/www/html/index.x3193
sudo rm -rf /var/www/html/index.php
#dos2unix
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y dos2unix
find /var/www/html/shell -name "*" -exec dos2unix {} \;
#
if [ "1" = "2" ]; then
#ssl
sudo a2enmod ssl
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y openssl
cd /var/www/html/shell/conf/ssl
#openssl req -x509 -newkey rsa:2048 -keyout ./server.key -out ./server.crt -days 36500 -nodes
sudo cp -R -f server.crt /etc/ssl/certs
sudo cp -R -f server.key /etc/ssl/private
sudo find /var/www/html/shell/conf/dns/ -name '000-default-ssl.conf' -exec sudo ln -sf {} /etc/apache2/sites-enabled/  \;
sudo /etc/init.d/apache2 force-reload
sudo /etc/init.d/apache2 restart
#mysql-5.6
sudo DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y mysql-server-5.6 mysql-client-core-5.6 mysql-client-5.6 mysql-client-core-5.6 mysql-client-core-5.6
fi
#
echo "------------------------Clean--------------------"  ;
sudo apt-get autoremove -y  ;
sudo apt-get clean -y  ;
sudo apt-get autoclean -y  ;
echo "--------------------------------------------"  ;
