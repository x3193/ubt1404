#!/bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

echo "-------------------cronen-------------------------" >> /root/cron.log;
apt-get autoremove -y ;
apt-get clean -y ;
apt-get autoclean -y ;
#pgrep scim-im-agent | xargs -I {} kill {}lo
pgrep ssh-agent | xargs -I {} kill {}
pgrep chromium-browse | xargs -I {} kill {}
echo "Clean ok!" >> /root/cron.log;

chmod -R 7777 /var/www/html ;
echo "Chmod ok!" >> /root/cron.log;

rm -rf -R /tmp/.*
killall mono 
a2dismod mod_mono_auto
a2dismod mod_mono
a2enmod mod_mono_auto 
service apache2 restart ;
service ssh start ;
service mysql restart ;
service cron restart ;
#rm -rf -R /tmp/*
echo "Restart ok!" >> /root/cron.log;

 export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
 export mono_dotnet="4" USER='x3193' DISPLAY=':1' DEBIAN_FRONTEND='noninteractive' HOME='/root' AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2' 
 TZ='Asia/Shanghai'; export TZ
 
echo $(date) >> /root/cron.log;
echo "-------------------cronen-------------------------" >> /root/cron.log;