#!/bin/bash

cd
#remove old files
sudo rm /usr/local/bin/mymn*
rm mymn*
#get wallet files
wget https://github.com/telostia/mymn-guides/raw/master/wallet/linux64/mymn-linux.tar.gz
sudo tar -xvf mymn-linux.tar.gz
sudo rm mymn-linux* mymn_auto.sh
sudo chmod +x mymn*
sudo cp mymn* /usr/local/bin

mymnd
watch mymn-cli getinfo

