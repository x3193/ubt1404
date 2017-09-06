#!/bin/bash

echo "--------------------debug------------------------" 
#crontab  
sudo rm -rf /var/www/html/shell/conf/cron/crontab
cd /var/www/html/shell/conf/cron
wget https://raw.githubusercontent.com/x3193/ubt1404/master/shell/conf/cron/crontab
sudo cp -R -f crontab /etc
sudo /etc/init.d/cron restart


