FROM ubuntu:trusty
RUN apt-get update && apt-get install -y --force-yes sudo apache2

RUN adduser --shell /bin/bash --system --ingroup root --force-badname --uid 1001 ops
#RUN echo "ops:EUIfgwe7" | chpasswd
RUN echo "ops ALL=(ALL:ALL) ALL" >> /etc/sudoers
#RUN echo "ops ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "Defaults visiblepw" >> /etc/sudoers
#RUN sed -i "s/# auth       sufficient pam_wheel.so trust/auth       sufficient pam_wheel.so trust/g" /etc/pam.d/su
RUN usermod -a -G sudo ops
RUN usermod -a -G adm ops

RUN chown -R ops:root /var
RUN chown -R ops:root /usr
RUN chown -R ops:root /bin

EXPOSE 80 443 8080
#VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]
#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
#ENTRYPOINT /usr/sbin/apache2ctl -D FOREGROUND
USER 1001
