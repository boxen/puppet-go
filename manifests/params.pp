# Public: Configuration for Go module

class go::params {
  case $::osfamily {
    Darwin: {
      include boxen::config

      $chgo_user  = $::boxen_user
      $chgo_root  = "${boxen::config::home}/chgo"
      $goenv_root = "${boxen::config::home}/goenv"
    }

    default: {
      $chgo_user  = 'root'
      $chgo_root  = '/usr/local/share/chgo'
      $goenv_root = '/usr/local/share/goenv'
    }
  }

  $auto_switch  = true

  $chgo_version = 'v0.1.4'
}
