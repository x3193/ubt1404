#!/bin/bash
 
echo "--------------------VNC------------------------" 

sudo cron &
sudo /etc/init.d/cron restart

#sudo anacron &
#sudo /etc/init.d/anacron start

sudo rm -rf -R /tmp/*
sudo chmod -R 7777 /var/www/html
cd /root

if [ $1 = "full" ] || [ $1 = "debug" ] ; then
service apache2 restart ;
killall mono
a2dismod mod_mono_auto
service apache2 restart ;
a2dismod mod_mono
service apache2 restart ;
a2enmod mod_mono_auto
 sudo service apache2 restart ;
 sudo service ssh start ;
 sudo service mysql restart ;

 #export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
 export LC_ALL='en_US.UTF-8' LANG='en_US.UTF-8' LANGUAGE='en_US:en'
 export DISPLAY=':1' mono_dotnet="4" AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2' 
 TZ='Asia/Shanghai'; export TZ

 tightvncserver -kill :1
 #export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
 export LC_ALL='en_US.UTF-8' LANG='en_US.UTF-8' LANGUAGE='en_US:en'
 export DISPLAY=':1' mono_dotnet="4" AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2' 
 TZ='Asia/Shanghai'; export TZ
 tightvncserver :1 
 sudo rm -rf -R /tmp/.*
 DISPLAY=':1' export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
 DISPLAY=':1' export DISPLAY=':1' mono_dotnet="4" AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2' 
 DISPLAY=':1' TZ='Asia/Shanghai'; export TZ 
 
 if [ $mono_dotnet = "4" ] ; then
  #cd /var/www/html/shell/conf/mono 
	#sudo cp -R -f mod_mono_auto.conf-4 /etc/apache2/mods-available/mod_mono_auto.conf
	sudo ln -sf /usr/bin/mod-mono-server4 /usr/bin/mod-mono-server
 fi
 if [ $mono_dotnet = "2" ] ; then
  #cd /var/www/html/shell/conf/mono 
	#sudo cp -R -f mod_mono_auto.conf-2 /etc/apache2/mods-available/mod_mono_auto.conf
	sudo ln -sf /usr/bin/mod-mono-server2 /usr/bin/mod-mono-server
 fi 
 sudo service apache2 restart ;

 if [ $1 = "debug" ] ; then
echo "--------------------debug------------------------" 
#crontab  
sudo rm -rf /var/www/html/shell/conf/cron/crontab
cd /var/www/html/shell/conf/cron
wget https://raw.githubusercontent.com/x3193/ubt1404/master/shell/conf/cron/crontab
sudo cp -R -f crontab /etc
sudo /etc/init.d/cron restart
echo "--------------------debug------------------------" 
 fi
 #setsid node /usr/local/lib/node_modules/tty.js/tty.js &  
 #cd /usr/local/lib/node_modules/tty.js;
 #setsid node ./tty.js & 
 pgrep -f '/var/www/html/noVNC-master/utils/websockify/run' || setsid /var/www/html/noVNC-master/utils/launch.sh --vnc localhost:5901 &
 #websockify -D --web=/usr/share/novnc/ --cert=/root/novnc.pem 6080 localhost:5901 &
fi

if [ $1 = "vnc" ]; then

 #sudo service apache2 restart ;
 #sudo service ssh start ;
 #sudo service mysql restart ;
 export LC_ALL='en_US.UTF-8' LANG='en_US.UTF-8' LANGUAGE='en_US:en'
 export DISPLAY=':1' mono_dotnet="4" AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2'
 TZ='Asia/Shanghai'; export TZ
 tightvncserver -kill :1
 tightvncserver :1
 setsid /var/www/html/noVNC-master/utils/launch.sh --vnc localhost:5901 &
 #websockify -D --web=/usr/share/novnc/ --cert=/root/novnc.pem 6080 localhost:5901 &
fi

if [ $1 = "php" ]; then
	service apache2 restart ;
 #sudo service apache2 restart ;
 #sudo service ssh start ;
 #sudo service mysql restart ;
fi

if [ $1 = "php-full" ]; then
 sudo service apache2 restart ;
 #sudo service ssh start ;
 sudo service mysql restart ;
fi

echo "--------------------VNC------------------------"

exit 0