# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "forwarded_port", guest: 3000, host: 3000
  
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", path: "ruby_provision.ps1"
end
