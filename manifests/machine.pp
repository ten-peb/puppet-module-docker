# @summary A short summary of the purpose of this class
#
# Installs docker-machine on a host 
#
# @example
#   include docker::machine
class docker::machine {
  $base='https://github.com/docker/machine/releases/download/v0.16.0'
  $hw = $::os['hardware']
  $url="${base}/docker-macine/Linux-${hw}"
  $dest='/usr/local/bin/docker-machine'
  $cmd = "curl -L ${url} > ${dest}"

  exec { $cmd:
    command => $cmd,
    path    => '/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin',
    onlyif  => "test  ! -f ${dest} "
  }

  file { $dest:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    =>  '0755',
    require => Exec[$cmd]
  }
}
