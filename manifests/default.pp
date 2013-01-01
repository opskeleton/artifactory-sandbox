group{ 'puppet': ensure  => present }

node artifactory {
  include artifactory
  include tomcat
  package{'unzip':
    ensure  => present
  }
  class{ 'artifactory':
    require => Package['unzip']
  }
}
