#!/bin/bash

echo "---------------------update-----------------------"  
rm -rf /var/lib/apt/lists/*;
sudo dpkg --configure -a;
sudo apt-get install -f;
sudo apt-get dist-upgrade -y ;
sudo apt-get update -y;
sudo apt-get upgrade -y ;
echo "-----------------------ppa---------------------"  ;
sudo add-apt-repository ppa:ubuntu-wine/ppa;
echo "---------------------update-----------------------"  
rm -rf /var/lib/apt/lists/*;
sudo dpkg --configure -a;
sudo apt-get install -f;
sudo apt-get dist-upgrade -y ;
sudo apt-get update -y;
sudo apt-get upgrade -y ;
echo "---------------------update-----------------------" 