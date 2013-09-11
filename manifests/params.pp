# Public: Configuration for Go module

class go::params {
  case $::osfamily {
    Darwin: {
      include boxen::config

      $goenv_user = $::boxen_user
      $goenv_root = "${boxen::config::home}/goenv"
    }

    default: {
      $goenv_user = 'root'
      $goenv_root = '/usr/local/share/goenv'
    }
  }

  $goenv_version = 'v0.0.3'
}
