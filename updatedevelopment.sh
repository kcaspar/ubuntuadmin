#!/bin/sh

echo "running update on system"
sudo apt-get update
echo "/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n"
#echo "system update complete - continue?"
#read text

echo "install build essential"
sudo apt-get install build-essential
echo "/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n"
#echo "build essential installed - continue?"
#read text

echo "install git"
sudo apt-get install git
echo "/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n"
#echo "git installed - continue?"
#read text

echo "autotools for git"
sudo apt-get update
sudo apt-get install autoconf
#automatically installs automake too
sudo apt-get install libtool intltool
sudo apt-get install libglib2.0-dev
sudo apt-get install libgtk2.0-dev 
#sudo apt-get install automake
sudo apt-get update
echo "/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n"
#echo "autotools installed - continue?"
#read text

echo "get geany from git"
git clone git://github.com/geany/geany.git geany
cd geany
echo "/n/n/n/n/n/n/n/n/n/n/n/n/n/n/n"
#echo "git copied - continue?"
#read text


git clone git://github.com/geany/geany.git geany


#sudo apt-get install mysql-server mysql-client
#whereis mysqladmin
#whereis mysql

