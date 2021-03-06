#FROM ubuntu:xenial
FROM ubuntu:trusty

#FROM index.docker.io/x3193/ubt1404:ubt1404-novnc-lamp-node.js-opsv3-2016
#FROM x3193/ubt1404:ubuntu-trusty-vnc-wine-php-2016
#
#ubt1604+vnc
#ubt1604+vnc+php
#FROM daocloud.io/x3193/ops:master-f3b1845
#
#ubt1404+vnc
#FROM daocloud.io/x3193/ops:master-5303ce7
#FROM daocloud.io/x3193/cd-opsv3:master-f613e65
#
#ubt1404+vnc+php+tty+.net2.0
#FROM daocloud.io/x3193/cd-opsv3:master-ab30dca
#FROM daocloud.io/x3193/cd-opsv3:master-04baace
#
#ubt1404+vnc+php+tty+.net2.0+opsv3
#FROM daocloud.io/x3193/ops:master-4b54c8b

MAINTAINER x3193.usa.cc <x3193@x3193.usa.cc>

RUN export DISPLAY=':1' DEBIAN_FRONTEND='noninteractive' HOME='/root' USER='root' AUTHORIZED_KEYS='**None**' ROOT_PASS='EUIfgwe7' TERM='xterm' INPUTRC='/etc/inputrc' APACHE_RUN_USER='www-data' APACHE_RUN_GROUP='www-data' APACHE_PID_FILE='/var/run/apache2/apache2.pid' APACHE_RUN_DIR='/var/run/apache2' APACHE_LOCK_DIR='/var/lock/apache2' APACHE_LOG_DIR='/var/log/apache2' TZ='Asia/Shanghai'; export TZ;dpkg --configure -a && apt-get install -f && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install expect sudo net-tools openssh-server pwgen zip unzip python-numpy python3-numpy cron curl git; mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config; sudo DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends --force-yes -y sudo net-tools wget vim zip unzip python-numpy python3-numpy cron curl;

ADD shell /var/www/html/shell

RUN sudo sh /var/www/html/shell/setup/this/ops-vnc-wine.sh trusty "wine";
RUN sudo sh /var/www/html/shell/setup/this/ops-u7php.sh trusty; 

EXPOSE 22 80 6080 5901 5902 8080 2222 3377 4200 8022 8000

CMD /run.sh full
