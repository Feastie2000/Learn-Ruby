#!/bin/bash

#This script will install Ruby on Rails
echo '--> Running apt-get update...'
sudo apt-get update

#The first step is to install some dependencies for Ruby
echo '--> Installing dependencies...'
sudo apt-get --assume-yes install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs

#Clone rbenv repository
echo '--> Cloning rbenv repository'
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"'               >> ~/.bashrc
source ~/.bashrc
exec $SHELL


#git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo '--> Cloning ruby-build repository'
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc


#Install Ruby
echo '--> Installing Ruby and Rails'
sudo -H -u vagrant bash -i -c 'rbenv install 2.3.3'
sudo -H -u vagrant bash -i -c 'rbenv rehash'
sudo -H -u vagrant bash -i -c 'rbenv global 2.3.3'
sudo -H -u vagrant bash -i -c 'gem install bundler --no-ri --no-rdoc'
sudo -H -u vagrant bash -i -c 'gem install rails -v 5.0.0.1'
sudo -H -u vagrant bash -i -c 'rbenv rehash'

#Setup MySQL
echo '--> Installing MySQL'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password TEST'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password TEST'
sudo apt-get --assume-yes install mysql-server mysql-client libmysqlclient-dev

exec $SHELL
