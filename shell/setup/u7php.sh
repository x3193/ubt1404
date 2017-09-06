#!/bin/bash

echo "---------------------update-----------------------"  ;
rm -rf /var/lib/apt/lists/*;
sudo dpkg --configure -a;
sudo apt-get install -f;
sudo apt-get dist-upgrade -y ;
sudo apt-get update -y;
sudo apt-get upgrade -y ;
echo "---------------------------php-----------------"  
#sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep -y --force-yes firefox putty htop unrar-free zip unzip git wget vim supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen php-apc php5-mcrypt php5-gd php5-curl php5-xdebug phpmyadmin -y  
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes zip unzip git wget vim supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen php-apc php5-mcrypt php5-gd php5-curl php5-xdebug phpmyadmin -y  
sudo service apache2 restart  
sudo service mysql restart  
sudo php5enmod mcrypt ;
echo "ServerName localhost" >> /etc/apache2/apache2.conf 
chmod -R 7777 /var/www/html 
sudo a2enmod rewrite 
sudo /etc/init.d/apache2 restart  
echo "---------------------filemanager-----------------------"  
sudo chmod -R 7777 /var/www/html 
sudo find /var/www/html -name index.html -delete 
cd /root/shell/conf/php 
sudo cp -f .htaccess filebox.php diy.php /var/www/html 
cd /root/shell/conf/dns
sudo cp -f 000-default.conf /etc/apache2/sites-available  
sudo service apache2 restart  
sudo cp -f /var/www/html/filebox.php /var/www/html/index.php 
echo "--------------------DNS------------------------"  
cd /root/shell/conf/dns 
sudo mkdir -vp /var/www/html/dz32
sudo chmod -R 7777 /var/www/html/dz32
sudo cp -f *.*.conf /etc/apache2/sites-available  
cd /
sudo find /etc/apache2/sites-available/ -name '*.conf' -exec sudo ln -s {} /etc/apache2/sites-enabled/  \;
sudo service apache2 restart 
echo "--------------------mysql------------------------"  
cd /root/shell/conf/mysql 
sudo cp -f my.cnf /var/lib/mysql 
sudo service mysql restart  
sudo /usr/bin/mysqladmin -u root password 'EUIfgwe7' 
sudo service mysql restart  
echo "--------------------phpmyadmin-----------------------"  
cd /var/www/html
sudo ln -s /usr/share/phpmyadmin phpmyadmin 
sudo chmod -R 7777 /usr/share/phpmyadmin 
cd /root/shell/conf/php
sudo cp -f Config.class.php /usr/share/phpmyadmin/libraries 
sudo cp -f diy.php /usr/share/phpmyadmin 
sudo php5enmod mcrypt
sudo service apache2 restart 
sudo service mysql restart 
echo "--------------------novnc-----------------------"  
cd /var/www/html
sudo chmod -R 7777 /var/www/html/noVNC-master 
cd /root/shell/conf/php
rm -rf /var/www/html/noVNC-master/vnc.html
rm -rf /var/www/html/noVNC-master/vnc_auto.html
sudo cp -f vnc.php /var/www/html/noVNC-master/index.php 
sudo cp -f diy.php /var/www/html/noVNC-master 
sudo touch /var/www/html/noVNC-master/vnc.html
echo "------------------------Clean--------------------"  ;
sudo apt-get autoremove -y  ;
sudo apt-get clean -y  ;
sudo apt-get autoclean -y  ;
echo "--------------------------------------------"  ;