# Public: Install GoEnv

class go(
  $goenv_root    = $go::params::goenv_root,
  $goenv_user    = $go::params::goenv_user,
  $goenv_version = $go::params::goenv_version,
) inherits go::params {
  if $::osfamily == 'Darwin'{
    include homebrew

    package { 'go':
      ensure => absent
    }

    file { "${boxen::config::envdir}/goenv.sh":
      content => template('go/goenv.sh.erb'),
      mode    => '0755'
    }
  }

  repository { $goenv_root:
    ensure => $goenv_version,
    force  => true,
    source => 'wfarr/goenv',
    user   => $goenv_user,
  }
}
