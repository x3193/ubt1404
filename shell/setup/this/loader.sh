#!/bin/bash

#RUN echo "-------------------ENV install----------------"
#export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
export DISPLAY=':1' AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2' 
TZ='Asia/Shanghai'; export TZ
#RUN echo "----------------------------------------------"

echo "---------------------pre-install-----------------------"  
dpkg --configure -a && apt-get install -f && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install expect sudo net-tools openssh-server pwgen zip unzip python-numpy python3-numpy cron curl gnome-schedule lxtask git
mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y sudo net-tools wget vim zip unzip python-numpy python3-numpy cron curl

cd /root
sudo wget -O ubt1404.zip http://sf.x3193.usa.cc/docker/ubt1404.zip
sudo unzip -o -d /root/ ubt1404.zip
cd /root/ubt1404
sudo cp -R -f set_root_pw.sh run.sh /
sudo chmod -R 7777 /*.sh

sudo mkdir -vp /var/www/html
sudo cp -R -f shell /var/www/html
sudo chmod -R 7777 /var/www/html/shell

echo "--------------------------------------------"  
