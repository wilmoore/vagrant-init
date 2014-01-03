# Vagrant Init

A minimalistic approach to bootstrapping a vagrant project. Start simple with the included bash script provisioning. It is up to you to enhance the provisioning script or configure Puppet, Chef, or any other provisioner supported by
vagrant.


## Requirements (install first)

-   Mac OSX, Linux, or Windows Operating System
-   [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
-   [Vagrant](http://downloads.vagrantup.com/)


## Default Provisioned Software

- [Ubuntu Precise 32-bit](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Boxes)
- Vim


## Usage

Once you have all of the required software installed (VirtualBox, Vagrant) fork and clone the project or download and unarchive into a directory on your computer then run the following commands in a terminal:

    % # cd to the directory where you unarchived the tarball
    % vagrant up

## Help, I don't know what to do next

If you are new to vagrant or haven't played with it for some time, you have two options:

1. cd /tmp && vagrant init ; less Vagrantfile
2. open 'http://docs.vagrantup.com/v2/getting-started/index.html'
