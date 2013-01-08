# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.define :artifactory do |artifactory|
    artifactory.vm.box = 'ubuntu-12.10'
    artifactory.vm.network :bridged
    artifactory.vm.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 4]
    artifactory.vm.host_name = 'artifactory'
    artifactory.vm.provision :puppet, :options => ["--modulepath=/vagrant/modules:/vagrant/static-modules"]
    artifactory.vm.network :hostonly, "192.168.1.16"
  end

end
