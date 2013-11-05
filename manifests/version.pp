# Public: Install a Go version with chgo
#
# Usage: go::version { '1.2.3': }

define go::version($ensure = present) {
  require go

  validate_re($ensure, '^(present|absent)$',
    "Go::Version[${name}] ensure must be present|absent, is ${ensure}")

  $dest = "${go::chgo_root}/versions/${name}"

  if $ensure == absent {
    file { $dest:
      ensure => absent,
      force  => true,
    }
  } else {
    exec { "chgo install ${name}":
      command  => "source ${go::chgo_root}/share/chgo/chgo.sh && chgo_install ${name}",
      creates  => $dest,
      provider => shell,
      user     => $go::chgo_user
    }

    Exec["chgo install ${name}"] {
      environment => "CHGO_ROOT=${go::chgo_root}"
    }
  }
}
