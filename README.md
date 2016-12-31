# Learn-Ruby
This repository is for personal use while learning Ruby-On-Rails

## Creating the Vagrant base box

In order to learn Ruby on Rails I will use a Vagrant box as the server running Ruby and Rails.  This section is a record of the setup of the vagrant base box I will use.

### Set up Vagrant

There are a number of steps that need to be taken before being able to use Vagrant to manage the build of the server

1. Install Vagrant
2. Install Virtual box
3. Get box from Hashicorp repository

#### Install Vagrant

As of writing the latest version of Vagrant is Version 1.9.1  Download and install from the Vagrant website: https://www.vagrantup.com/downloads.html

On Windows 10 the install is straight forward, simply run the installer as Administrator, sit back and wait.  Once this is complete you may need to do a reboot, once you are back up and running test that Vagrant is installed, by running `vagrant -v` your output should be Vagrant 1.9.1.

#### Install Virtual Box

Vagrant uses standard software virtualizatin systems such as Oracles Virtual Box or VMWare to manage and run the virtual server.  Here I used Virtual Box as this is open source and very well supported, the latest version (at the time of writing) is Version 5.1.12 This is compatible with the version of Vagrant above.  This can be downloaded from the Virtual Box website: https://www.virtualbox.org/wiki/Downloads

Again on Windows 10 this is a straightfoward install.  Simply run the installer as Administrator and wait for it to complete.  You can test that this has installed correctly by launching the Virtual box application.

#### Select Base Box

Now that the host environment is setup to run Vagrant a base box can be selected and configured.  Base boxes can be selected from the Hashicorp website:  https://atlas.hashicorp.com/boxes/search

I selected the official Ubuntu 16.04 server (Official Ubuntu 16.04 LTS (Xenial Xerus) Daily Build).

1. Create a new project folder C:\Vagrant VMS\Ruby
2. From cmdr change to this folder and run `vagrant init ubuntu` This will add the default vagrantfile to your folder.
3. Edit the vagrantfile, replcing it with:
  ```ruby
  # -*- mode: ruby -*-
  # vi: set ft=ruby :

  Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
  
    # Forward the Rails server default port to the host
    config.vm.network :forwarded_port, guest: 3000, host: 3000
  
  end
  ```
4. Now launch the box, this initial launch will take sometime, as it needs to download the box to your local machine.  To do this run `vagrant up --provider virtualbox` 
5. Once the machine has booted up you can test this by launching an SSH session `vagrant ssh` You should now get the Linux prompt

By default vagrant sets up a shared folder between the the virtual server and your host machine.  This is the folder that you setup for the project, the one with the vagrant file in.  To access this on the server you can `cd /vagrant`

## Setup Server for Ruby on rails

The next step is to setup the server to be able to run Ruby on rails server.  To set this up I used the very good resource at GoRails: https://gorails.com/setup/ubuntu/16.04

