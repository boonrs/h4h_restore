# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "sqlite"
    chef.add_recipe "rvm::vagrant"
    chef.add_recipe "rvm::system"

    chef.json = {
      rvm: {
        default_ruby: "2.0.0-p0"
      }
    }
  end

  config.vm.provision :shell, inline: "cd /vagrant && bundle"

  config.vm.network :forwarded_port, guest: 3000, host: 3000
end
