#!/bin/bash

id -un
echo "run-apache2.sh"
exec /usr/sbin/sshd -D
exit 0
