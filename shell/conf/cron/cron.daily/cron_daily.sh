#!/bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

echo "--------------------------------------------" >> /root/cron.log;
sudo dpkg --configure -a
sudo apt-get autoremove -y ;
sudo apt-get clean -y ;
sudo apt-get autoclean -y ;
#sudo apt-get update ;
#sudo apt-get upgrade -y ;
#sudo apt-get dist-upgrade -y ;
#rm -rf /var/lib/apt/lists/*;
echo "Update ok!" >> /root/cron.log;

#pgrep scim-im-agent | xargs -I {} kill -9 {}
pgrep ssh-agent | xargs -I {} kill -9 {}
pgrep chromium-browse | xargs -I {} kill -9 {}
echo "Clean ok!" >> /root/cron.log;

sudo rm -rf -R /tmp/*
if [ $1 = "full" ] || [ $1 = "vnc" ]; then
 sudo tightvncserver -kill :1
fi
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
 export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
 export DISPLAY=':1' mono_dotnet="4" DEBIAN_FRONTEND='noninteractive' HOME='/root' USER='root' AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2' 
 TZ='Asia/Shanghai'; export TZ

if [ $1 = "full" ] || [ $1 = "vnc" ]; then
 sudo tightvncserver :1
 DISPLAY=':1' export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
 DISPLAY=':1' export DISPLAY=':1' mono_dotnet="4" DEBIAN_FRONTEND='noninteractive' HOME='/root' USER='root' AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2' 
 DISPLAY=':1' TZ='Asia/Shanghai'; export TZ 
 sudo rm -rf -R /tmp/.*
fi

echo "Restart ok!" >> /root/cron.log;

echo $(date) >> /root/cron.log;
echo "--------------------------------------------" >> /root/cron.log;