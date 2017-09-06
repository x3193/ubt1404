#FROM ubuntu:xenial
FROM ubuntu:trusty
#FROM x3193/dc:latest
#FROM x3193/ubt1404:latest
MAINTAINER x3193.tk <x3193@x3193.tk> 

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV USER root
ENV AUTHORIZED_KEYS **None**
ENV ROOT_PASS EUIfgwe7

# Install packages
RUN dpkg --configure -a && apt-get install -f && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install expect sudo openssh-server python-numpy python3-numpy
#RUN dpkg --configure -a && apt-get install -f && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install sudo net-tools openssh-server pwgen zip unzip python-numpy python3-numpy cron
RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config

ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

#root pw
RUN sh /set_root_pw.sh

ADD run-apache2.sh /run-apache2.sh
RUN chmod a+x /run-apache2.sh

RUN echo "====="
RUN adduser --shell /bin/bash --system --ingroup root --force-badname --uid 1001 ops
RUN echo "ops ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "Defaults visiblepw" >> /etc/sudoers
RUN usermod -a -G sudo ops
RUN usermod -a -G adm ops
RUN echo "1000340000 ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN chown -R 1000340000:root /etc/ssh/
RUN chmod -R 0700 /etc/ssh/
RUN echo "AllowUsers ops 1000340000" >> /etc/ssh/sshd_conf
RUN sed -i "s/Port 22*/Port 2222/g" /etc/ssh/sshd_config
RUN service ssh restart
RUN cat /etc/ssh/sshd_config
RUN cat /etc/ssh/sshd_conf
RUN echo "====="
#apache2
#ENV APACHE_RUN_USER ops
#ENV APACHE_RUN_GROUP root
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
# Only /var/log/apache2 is handled by /etc/logrotate.d/apache2.
ENV APACHE_LOG_DIR /var/log/apache2
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install apache2 -y  
RUN service apache2 restart
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN sed -i "s/Listen 80*/Listen 8080/g" /etc/apache2/ports.conf
RUN sed -i "s/<VirtualHost \*\:80>/<VirtualHost \*\:8080>/g" /etc/apache2/sites-available/000-default.conf
RUN cat /etc/apache2/ports.conf
RUN cat /etc/apache2/sites-available/000-default.conf
RUN chown -R www-data:root /var/log/apache2
RUN chmod -R 7777 /var/log/apache2
RUN chown -R www-data:root /var/run/apache2
RUN chmod -R 7777 /var/run/apache2
RUN chown -R www-data:root /var/lock/apache2
RUN chmod -R 7777 /var/lock/apache2
RUN usermod -a -G root www-data
RUN usermod -a -G sudo www-data
RUN usermod -a -G adm www-data
RUN echo "www-data ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN service apache2 start
RUN echo "====="

EXPOSE 22
EXPOSE 80
EXPOSE 6080
EXPOSE 5901
EXPOSE 5902
EXPOSE 8080
EXPOSE 2222

USER 1001
CMD /run-apache2.sh
