# @summary A short summary of the purpose of this class
#
# Installs docker-compose
#
# @example
#   include docker::compose
class docker::compose {

  $wget='curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'
  exec{$wget:
    path   => '/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin'
    onlyif => 'test ! -f /usr/local/bin/docker-compose'
  }
  file{'/usr/local/bin/docker-compose':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Exec[$wget]
  }
}
