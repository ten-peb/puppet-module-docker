# @summary A short summary of the purpose of this class
#
# Installs docker-ce and manages docker service
#
# @example
#   include docker
class docker {
  include docker::package
  include docker::service 
}
