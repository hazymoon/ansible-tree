# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos6"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024", '--cpus', 2]
    # CentOSがIPv6の解決で遅くなる問題に対策
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  end
  config.cache.auto_detect = true

  config.vm.network :forwarded_port, guest: 80, host: 8000, id: 'http'
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  config.vm.provision 'ansible' do |ansible|
    ansible.inventory_path = './hosts'
    ansible.playbook = 'site.yml'
  end
end
