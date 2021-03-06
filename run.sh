#!/bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

if [ "$2" = "" ]  || [ -z "$2" ] ; then
echo "---------------full--------------------"
if [ "${AUTHORIZED_KEYS}" != "**None**" ]; then
    echo "=> Found authorized keys"
    mkdir -p /root/.ssh
    chmod 700 /root/.ssh
    touch /root/.ssh/authorized_keys
    chmod 600 /root/.ssh/authorized_keys
    IFS=$'\n'
    arr=$(echo ${AUTHORIZED_KEYS} | tr "," "\n")
    for x in $arr
    do
        x=$(echo $x |sed -e 's/^ *//' -e 's/ *$//')
        cat /root/.ssh/authorized_keys | grep "$x" >/dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "=> Adding public key to /root/.ssh/authorized_keys: $x"
            echo "$x" >> /root/.ssh/authorized_keys
        fi
    done
fi

if [ ! -f /.root_pw_set ]; then
	sh /var/www/html/shell/loader/this/set_root_pw.sh
fi

if [ "$1" = "debug" ] ; then
sudo rm -rf /var/www/html/shell/loader/this/vnc.sh
cd /var/www/html/shell/loader/this
wget https://raw.githubusercontent.com/x3193/ubt1404/master/shell/loader/this/vnc.sh
fi
setsid sudo sh /var/www/html/shell/loader/this/vnc.sh $1 &
echo "-----------------full------------------"
fi

if [ "$2" = "opsv3" ] ; then
echo "----------------opsv3-------------------"
if [ "$1" = "debug" ] ; then
rm -rf /var/www/html/shell/loader/this/opsv3.sh
cd /var/www/html/shell/loader/this
wget https://raw.githubusercontent.com/x3193/ubt1404/master/shell/loader/this/opsv3.sh
fi
setsid sh /var/www/html/shell/loader/this/opsv3.sh &
echo "-----------------opsv3------------------"
fi

exec /usr/sbin/sshd -D

exit 0

