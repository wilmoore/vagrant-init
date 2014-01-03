# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box     = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
# config.vm.network :bridged
# config.vm.network :hostonly, "192.168.0.29"
# config.vm.forward_port 3306, 3306
  config.vm.provision :shell, :path => "base.sh"
end
