#!/bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
 
echo "--------------------------------------------" >> /var/www/html/shell/conf/cron/cron.log;
sudo dpkg --configure -a
sudo chmod -R 7777 /var/www/html ;

sudo service apache2 restart ;
sudo service ssh start ;
sudo service mysql restart ;
sudo service cron restart ;

export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
TZ='Asia/Shanghai'; export TZ

tightvncserver -kill :1
tightvncserver :1
sudo service apache2 stop;sudo service amysql stop; killall lxsession lxpanel openbox pcmanfm cron;

echo $(date) >> /var/www/html/shell/conf/cron/cron.log;
echo "--------------------------------------------" >> /var/www/html/shell/conf/cron/cron.log;