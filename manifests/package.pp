# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include docker::package
class docker::package {
  $get_key_curl='curl -fsSL https://download.docker.com/linux/ubuntu/gpg'
  $load_key_cmd="${get_key_curl} | apt-key add -"
  exec {'get docker-ce key':
    command => $load_key_cmd,
    path    => '/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/bin',
    unless => 'apt-key list | grep Docker' 
  }
  $repourl='https://download.docker.com/linux/ubuntu'
  $repoconf="deb [arch=${::architecture}] ${::codename} stable"
  $pkgname='docker-ce'
  file{'/etc/apt/sources.list.d/docker.list':
    ensure   => present,
    content => template('docker/docker_list.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
    notify  => Exec['docker apt update'],
    require => Exec['get docker-ce key']
  }

  exec {'docker apt update':
    command => 'apt-get update',
    path='/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/bin',
    refreshonly => true
  }
  package {'docker-ce':
    ensure => latest
  }
}

