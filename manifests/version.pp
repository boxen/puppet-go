# Public: Install a Go version with goenv
#
# Usage: go::version { '1.2.3': }

define go::version($ensure = present) {
  require go

  validate_re($ensure, '^(present|absent)$',
    "Go::Version[${name}] ensure must be present|absent, is ${ensure}")

  $dest = "${go::goenv_root}/versions/${name}"

  if $ensure == absent {
    file { $dest:
      ensure => absent,
      force  => true,
    }
  } else {
    exec { "goenv install ${name}":
      command  => "${go::goenv_root}/bin/goenv install ${name}",
      creates  => $dest,
      provider => shell,
      user     => $go::goenv_user
    }

    Exec["goenv install ${name}"] {
      environment +> "GOENV_ROOT=${go::goenv_root}"
    }
  }
}
