# Setting up artifactory
# see http://devopsnet.com/2012/07/24/installing-artifactory-on-ubuntu/
class artifactory{
  package{'unzip':
    ensure  => present
  }

  common::archive { 'artifacory-2.6.6':
    ensure           => present,
    url              => 'http://downloads.sourceforge.net/project/artifactory/artifactory/2.6.6/artifactory-2.6.6.zip',
    digest_string    => 'f18a249481c35f9250eb3eaccb58511f',
    src_target       => '/opt',
    target           => '/usr/share',
    follow_redirects => true,
    extension        => 'zip',
    require          => Package['unzip'],
  }

  package{'openjdk-7-jre':
    ensure  => present
  }

  exec{'install artifactory':
    command => '/usr/share/artifactory-2.6.6/bin/install.sh',
    user    => 'root',
    require => [Common::Archive['artifacory-2.6.6'],Package['openjdk-7-jre']]
  }

  file{'/etc/artifactory/':
    ensure  => directory
  }

  file {'/etc/artifactory/default':
    ensure=> file,
    mode  => '0644',
    source=> 'puppet:///modules/artifactory/default',
    owner => root,
    group => root,
  }
}
