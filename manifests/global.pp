# Public: Set the global default go version
#
# Usage: go::global { '1.9.0': }
class go::global($version = '1.1.1') {
  require go
  $klass = join(['go', join(split($version, '[.]'), '_')], '::')
  require $klass

  file { "${go::goenv_root}/version":
    content => "${version}\n",
    replace => true,
  }
}
