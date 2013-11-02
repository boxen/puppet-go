# Public: Configuration for Go module

class go::params {
  case $::osfamily {
    Darwin: {
      include boxen::config

      $chgo_user = $::boxen_user
      $chgo_root = "${boxen::config::home}/chgo"
    }

    default: {
      $chgo_user = 'root'
      $chgo_root = '/usr/local/share/chgo'
    }
  }

  $auto_switch  = true
  $goenv_root   = $chgo_root
  $chgo_version = 'v0.1.0'
}
