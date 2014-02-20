# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos6"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "256", '--cpus', 1]
  end
  config.vm.network :forwarded_port, guest: 80, host: 8000, id: 'http'

  config.vm.provision 'ansible' do |ansible|
    ansible.inventory_path = './hosts'
    ansible.playbook = 'site.yml'
  end
end
