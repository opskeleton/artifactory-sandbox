# -*- mode: ruby -*-
# vi: set ft=ruby :

update = <<SCRIPT
if [ ! -f /tmp/up ]; then
  sudo sed -i.bak s/us.archive/il.archive/g /etc/apt/sources.list
  sudo aptitude update 
  touch /tmp/up
fi
SCRIPT


Vagrant.configure("2") do |config|

  bridge = ENV['VAGRANT_BRIDGE']
  bridge ||= 'eth0'

  config.vm.define :artifactory do |artifactory|
    artifactory.vm.box = 'ubuntu-14.10_puppet-3.7.3' 
    artifactory.vm.network :public_network, :bridge => bridge
    artifactory.vm.hostname = 'artifactory.local'
    artifactory.vm.network :private_network, ip: '192.168.2.30'
    artifactory.vm.network :forwarded_port, guest: 8081, host: 8081

    artifactory.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 2]
    end

    artifactory.vm.provision :shell, :inline => update
    artifactory.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'manifests'
      puppet.manifest_file  = 'default.pp'
      puppet.options = '--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml'
    end
  end
end
