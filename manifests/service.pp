# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include docker::service
class docker::service {
  include docker::package
  
  service{'docker':
    ensure => running,
    enable => true,
    require => Package['docker-ce']
   }
}
