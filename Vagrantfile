# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
  sudo apt-get -y update
  sudo apt-get -y install curl git-core python-software-properties ruby-dev libpq-dev build-essential nginx libsqlite3-0 libsqlite3-dev libxml2 libxml2-dev libxslt1-dev nodejs postgresql postgresql-contrib imagemagick

  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"'               >> ~/.bashrc
  source ~/.bashrc

SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # config.vm.provider :virtualbox do |vb|
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end

  config.vm.provision :shell, privileged: false, inline: $script
end