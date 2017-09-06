#!/bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

echo "-------------------anacron-------------------------" >> /root/cron.log;
apt-get autoremove -y ;
apt-get clean -y ;
apt-get autoclean -y ;
#apt-get update ;
#apt-get upgrade -y ;
#apt-get dist-upgrade -y ;
#rm -rf /var/lib/apt/lists/*;
echo "Update ok!" >> /root/cron.log;

#pgrep scim-im-agent | xargs -I {} kill -9 {}
pgrep ssh-agent | xargs -I {} kill -9 {}
pgrep chromium-browse | xargs -I {} kill -9 {}
echo "Clean ok!" >> /root/cron.log;

rm -rf -R /tmp/*
if [ $1 = "full" ] || [ $1 = "vnc" ]; then
 tightvncserver -kill :1
fi
service apache2 restart ;
killall mono
a2dismod mod_mono_auto
service apache2 restart ;
a2dismod mod_mono
service apache2 restart ;
a2enmod mod_mono_auto
 service apache2 restart ;
 service ssh start ;
 service mysql restart ;
 export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
 export DISPLAY=':1' AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2' 
 TZ='Asia/Shanghai'; export TZ
if [ $1 = "full" ] || [ $1 = "vnc" ]; then
 tightvncserver :1
 DISPLAY=':1' export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
 DISPLAY=':1' export DISPLAY=':1' AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2' 
 DISPLAY=':1' TZ='Asia/Shanghai'; export TZ 
 rm -rf -R /tmp/.*
fi

echo "Restart ok!" >> /root/cron.log;

echo $(date) >> /root/cron.log;
echo "--------------------anacron------------------------" >> /root/cron.log;