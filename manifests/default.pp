group{ 'puppet': ensure  => present }

node artifactory {
  include artifactory
  class{'artifactory': }
}
