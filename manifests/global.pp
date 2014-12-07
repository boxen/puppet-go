# Public: Set the global default go version
#
# Usage: go::global { '1.9.0': }
class go::global($version = '1.1.1') {
  require go
  ensure_resource('go::version', $version, {ensure => present})

  file { "${go::chgo_root}/version":
    content => "${version}\n",
    replace => true,
  }
}
