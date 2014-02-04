# Setting up artifactory
# see http://devopsnet.com/2012/07/24/installing-artifactory-on-ubuntu/
class artifactory{

  $version = '3.1.0'

  package{'unzip':
    ensure  => present
  }

  common::archive { "artifacory-${version}":
    ensure           => present,
    url              => "http://garr.dl.sourceforge.net/project/artifactory/artifactory/${version}/artifactory-${version}.zip",
    digest_string    => 'facf31cdecb6c388e9d1d1a3bc535a6b',
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
    command => "/usr/share/artifactory-${version}/bin/installService.sh",
    user    => 'root',
    require => [Common::Archive["artifacory-${version}"],Package['openjdk-7-jre']]
  }

  file{'/etc/artifactory/':
    ensure  => directory
  }

  file {'/etc/artifactory/default':
    ensure  => file,
    mode    => '0644',
    source  => 'puppet:///modules/artifactory/default',
    owner   => root,
    group   => root,
    require => File['/etc/artifactory']
  }

  service{'artifactory':
    ensure    => running,
    enable    => true,
    hasstatus => false,
    require   => [File['/etc/artifactory/default'],Exec['install artifactory']]
  }
}
