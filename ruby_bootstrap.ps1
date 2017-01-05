#!/bin/bash

#This script will install Ruby on Rails
sudo apt-get update

#The first step is to install some dependencies for Ruby
sudo apt-get --assume-yes install git-core 
sudo apt-get --assume-yes install curl
sudo apt-get --assume-yes install zlib1g-dev
sudo apt-get --assume-yes install build-essential
sudo apt-get --assume-yes install libssl-dev
sudo apt-get --assume-yes install libreadline-dev
sudo apt-get --assume-yes install libyaml-dev
sudo apt-get --assume-yes install libsqlite3-dev
sudo apt-get --assume-yes install sqlite3
sudo apt-get --assume-yes install libxml2-dev
sudo apt-get --assume-yes install libxslt1-dev
sudo apt-get --assume-yes install libcurl4-openssl-dev
sudo apt-get --assume-yes install python-software-properties
sudo apt-get --assume-yes install libffi-dev
sudo apt-get --assume-yes install nodejs

#Install Ruby using rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"'               >> ~/.bashrc
source ~/.bashrc


#git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
#echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
#exec $SHELL

#rbenv install 2.3.3
#rbenv global 2.3.3
#ruby -v