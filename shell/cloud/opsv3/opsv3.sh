#!/bin/bash

echo "--------------------OPSV3------------------------"

#data
uid=$2
username=$4
#等号两边均不能有空格存在 
echo "====="
#1001
adduser --shell /bin/bash --system --ingroup root --force-badname --uid 1001 ${username}
sed -i "s/${username}:x:1001:0::/${username}:x:1001:0:${username}:/g" /etc/passwd
sed -i "s/${username}:x:1001:0:${username}:/${username}:x:${uid}:0:${username}:/g" /etc/passwd
addgroup --system --gid 1001 ${username}
sed -i "s/${username}:x:1001:/${username}:x:${uid}:/g" /etc/group
cat /etc/passwd
echo "${username} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
usermod -a -G sudo ${username}
usermod -a -G adm ${username}
tightvncserver :1
DISPLAY=:1 PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
DISPLAY=:1 echo "${username}:$PASS" | chpasswd
tightvncserver -kill :1
#ssh
echo "${uid} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
chown -R ${uid}:root /etc/ssh/
chmod -R 0700 /etc/ssh/
echo "AllowUsers root ${username} ${uid}" >> /etc/ssh/sshd_conf
sed -i "s/Port 22.*/Port 2222/g" /etc/ssh/sshd_config
service ssh restart
mkdir -vp /home/${username}/.ssh
ssh-keygen -t rsa -f /home/${username}/.ssh/id_rsa -q -N ""
cd /var/www/html/shell/conf/.ssh  
cp -R -f known_hosts id_rsa.pub id_rsa authorized_keys default.ppk /home/${username}/.ssh 
chmod -R 0600 /home/${username}/.ssh 
chmod 0700 /home/${username} 
chmod 0700 /home/${username}/.ssh 
chmod 0644 /home/${username}/.ssh/authorized_keys 
mkdir -vp /home/${username}/ssh
cp -R -f /home/${username}/.ssh/* /home/${username}/ssh
cd /var/www/html/shell/conf/ssh 
cp -R -f ssh /etc/init.d 
cat /etc/ssh/sshd_config
cat /etc/ssh/sshd_conf
echo "====="
sed -i "s/Listen 80.*/Listen 8080/g" /etc/apache2/ports.conf
#sed -i "s/Listen 8080/Listen 8080 \r\nListen 8022/g" /etc/apache2/ports.conf
sed -i "s/<VirtualHost \*\:80>.*/<VirtualHost \*\:8080>/g" /var/www/html/shell/conf/dns/000-default.conf
cat /etc/apache2/ports.conf
cat /var/www/html/shell/conf/dns/000-default.conf
usermod -a -G root www-data
usermod -a -G sudo www-data
usermod -a -G adm www-data

echo "====="

sudo dpkg --add-architecture i386
sudo dpkg --configure -a
sudo dpkg-reconfigure -p high -f noninteractive debconf 
sudo apt-get install -f
#sudo apt-get update --force-yes  -y
#sudo apt-get upgrade --force-yes  -y 
#sudo apt-get dist-upgrade --force-yes  -y
sudo apt-get autoremove -y  
sudo apt-get clean -y  
sudo apt-get autoclean -y 
sudo rm -rf -R /var/lib/apt/lists/*
sudo rm -rf -R /tmp

echo "====="

chmod -R 7777 /var/www
chmod -R 7777 /var/log/apache2
chmod -R 7777 /var/run/apache2
chmod -R 7777 /var/lock/apache2
chmod -R 7777 /tmp

export LC_ALL='zh_CN.UTF-8' LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh:en_US:en'
export DISPLAY=':1' AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2'
TZ='Asia/Shanghai'; export TZ
#tightvncserver :1
chmod -R 7777 `which chown`
find / -name '*' -exec `which chown` -hfR ${uid}:root {} \;
chmod -R 0755 `which chown`
#tightvncserver -kill :1

echo "====="

if [ $1 = "xenial" ]; then

echo "====="
sudo dpkg --add-architecture i386
sudo dpkg --configure -a
sudo dpkg-reconfigure -p high -f noninteractive debconf 
sudo apt-get install -f
sudo apt-get update -y
sudo apt-get upgrade -y 
sudo apt-get dist-upgrade -y 
echo "====="
#rm -rf /root/www
chmod -R 7777 `which chmod`
find / -name '*' -exec `which chown` -hfR ${uid}:root {} \;
chmod -R 7777 /var/www
chmod -R 7777 /var/log/apache2
chmod -R 7777 /var/run/apache2
chmod -R 7777 /var/lock/apache2
chmod -R 7777 /tmp
chmod -R 0755 `which chmod`
echo "====="

find /etc -name '*' -exec chown ${uid}:root {} \; 
find /home -name '*' -exec chown ${uid}:root {} \; 
find /usr -name '*' -exec chown ${uid}:root {} \; 
find /var -name '*' -exec chown ${uid}:root {} \; 
find /bin -name '*' -exec chown ${uid}:root {} \; 
find /lib -name '*' -exec chown ${uid}:root {} \; 
find /lib64 -name '*' -exec chown ${uid}:root {} \; 
find /media -name '*' -exec chown ${uid}:root {} \; 
find /mnt -name '*' -exec chown ${uid}:root {} \; 
find /opt -name '*' -exec chown ${uid}:root {} \; 
find /root -name '*' -exec chown ${uid}:root {} \; 
find /run -name '*' -exec chown ${uid}:root {} \; 
find /sbin -name '*' -exec chown ${uid}:root {} \; 
find /srv -name '*' -exec chown ${uid}:root {} \; 
find /tmp -name '*' -exec chown ${uid}:root {} \; 

find /etc -name '*' -exec chown ${uid}:root {} \; 
find /root -name '*' -exec chown ${uid}:root {} \; 
find /home -name '*' -exec chown ${uid}:root {} \; 
find /var -name '*' -exec chown ${uid}:root {} \; 
find /lib -name '*' -exec chown ${uid}:root {} \; 
find /lib64 -name '*' -exec chown ${uid}:root {} \; 
find /media -name '*' -exec chown ${uid}:root {} \; 
find /mnt -name '*' -exec chown ${uid}:root {} \; 
find /opt -name '*' -exec chown ${uid}:root {} \; 
find /run -name '*' -exec chown ${uid}:root {} \; 
find /srv -name '*' -exec chown ${uid}:root {} \; 
find /tmp -name '*' -exec chown ${uid}:root {} \; 
find /usr -name '*' -exec chown ${uid}:root {} \; 
find /sbin -name '*' -exec chown ${uid}:root {} \; 
find /bin -name '*' -exec chown ${uid}:root {} \;

find / -name '*' -exec `which chown` -h ${uid}:root {} \;
chown -R ${uid}:root /etc/ssh/
chmod -R 0700 /etc/ssh/
chown -R ${uid}:root /var/www
chmod -R 7777 /var/www
chown -R ${uid}:root /var/log/apache2
chmod -R 7777 /var/log/apache2
chown -R ${uid}:root /var/run/apache2
chmod -R 7777 /var/run/apache2
chown -R ${uid}:root /var/lock/apache2
chmod -R 7777 /var/lock/apache2
chmod -R 0600 /root/.vnc/passwd
chmod -R 7777 /tmp

fi
echo "====="
echo "--------------------OPSV3------------------------"
