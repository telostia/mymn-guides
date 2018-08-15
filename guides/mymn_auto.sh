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
#get wallet files
#wget https://raw.githubusercontent.com/telostia/mymn-guides/master/wallet/linux/mymn_linux.tar.gz
wget https://github.com/telostia/mymn-guides/raw/master/wallet/linux64/mymn-linux.tar.gz
tar -xvf mymn-linux.tar.gz
rm mymn-linux* mymn_auto.sh
chmod +x mymn*
cp mymn* /usr/local/bin
ufw allow 10261/tcp

#masternode input

#echo -e "${GREEN}Now paste your Masternode key by using right mouse click and press ENTER ${NONE}";
#read MNKEY

EXTIP=`curl -s4 icanhazip.com`
#USER=`pwgen -1 20 -n`
PASSW=`pwgen -1 20 -n`

echo -e "${GREEN}Preparing config file ${NONE}";

rm -rf $HOME/.mymn
sudo mkdir $HOME/.mymn

printf "addnode=139.99.197.112:10261\naddnode=139.99.197.135:10261\naddnode=139.99.196.73:10261\naddnode=139.99.202.60:10261\naddnode=139.99.158.38:10261\naddnode=220.233.78.249:10261\n\nrpcuser=mymn432345$PASSW\nrpcpassword=$PASSW\\ndaemon=1\nlisten=1" >  $HOME/.mymn/mymn.conf

#MN STUFF
#\nrpcport=66541\nrpcallowip=127.0.0.1\nserver=1\nmaxconnections=54\nexternalip=$EXTIP:10261\nmasternode=1\nmasternodeprivkey=$MNKEY


mymnd
watch mymn-cli getinfo

