#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install git -y
sudo apt-get install nano -y
sudo apt-get install curl -y
sudo apt-get install pwgen -y
sudo apt-get install wget -y
sudo apt-get install build-essential libtool automake autoconf -y
sudo apt-get install autotools-dev autoconf pkg-config libssl-dev -y
sudo apt-get install libgmp3-dev libevent-dev bsdmainutils libboost-all-dev -y
sudo apt-get install libzmq3-dev -y
sudo apt-get install libminiupnpc-dev -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y

cd
#remove old files
sudo rm /usr/local/bin/mymn*
rm mymn*
#get wallet files
wget https://github.com/MyMNProject/mymn-guides/raw/master/wallet/linux64/mymn-linux.tar.gz
sudo tar -xvf mymn-linux.tar.gz
sudo rm mymn-linux* mymn_auto.sh
sudo chmod +x mymn*
sudo cp mymn* /usr/local/bin
sudo ufw allow 10261/tcp

EXTIP=`curl -s4 icanhazip.com`
#USER=`pwgen -1 20 -n`
PASSW=`pwgen -1 20 -n`

echo -e "${GREEN}Preparing config file ${NONE}";

rm -rf $HOME/.mymn
sudo mkdir $HOME/.mymn

printf "addnode=139.99.159.113:10261\naddnode=139.99.159.77:10261\naddnode=139.99.197.112:10261\naddnode=139.99.196.73:10261\naddnode=139.99.202.60:10261\naddnode=139.99.158.38:10261\naddnode=220.233.78.249:10261\n\nrpcuser=mymn432345$PASSW\nrpcpassword=$PASSW\\ndaemon=1\nlisten=1" >  $HOME/.mymn/mymn.conf

mymnd
watch mymn-cli getinfo

