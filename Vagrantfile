# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.define :artifactory do |artifactory|
    artifactory.vm.box = 'ubuntu-12.10'
    artifactory.vm.network :bridged
    artifactory.vm.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 4]
    artifactory.vm.host_name = 'artifactory'
    artifactory.vm.provision :puppet, :options => ["--modulepath=/vagrant/modules:/vagrant/static-modules"]
  end

end
