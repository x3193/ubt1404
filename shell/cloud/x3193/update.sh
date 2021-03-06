#!/bin/bash

echo "--------------------X3193 update------------------------" 
echo "--------------------USER--------------------------------" 
adduser --shell /bin/bash --system --ingroup root --force-badname --uid 1001 x3193
echo "x3193 ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
echo "${username}:$PASS" | chpasswd
echo "--------------------shellinabox-------------------------"
sudo add-apt-repository ppa:malcscott/shellinabox -y
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --install-recommends shellinabox
echo "--------------------------------------------------------"

