# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Vagrant Boxe
  config.vm.box = "ubuntu/trusty64"
  
  # Static IP address
  config.vm.network :private_network, ip: "192.168.50.4"
  
  # VirtualBox customizations
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 2
  end
  
  # Avoid warning "stdin: is not a tty error" when running `vagrant up`
  # See: https://github.com/mitchellh/vagrant/issues/1673
  config.ssh.shell = "bash"
  
  # Vagrant is not yet compatible with guest-installed Ansible 2.x
  # See: https://github.com/mitchellh/vagrant/issues/6793
  # See: https://github.com/mitchellh/vagrant/issues/6757
  config.vm.provision :shell, path: "./ansible/init.sh"
end