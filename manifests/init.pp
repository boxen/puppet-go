# Public: Install chgo

class go(
  $chgo_root    = $go::params::chgo_root,
  $chgo_user    = $go::params::chgo_user,
  $chgo_version = $go::params::chgo_version,
  $chgo_source  = $go::params::chgo_source,
  $auto_switch  = $go::params::auto_switch,

  $goenv_root   = $go::params::goenv_root,
) inherits go::params {
  if $::osfamily == 'Darwin'{
    include homebrew

    package { 'go':
      ensure => absent
    }

    file { "${boxen::config::envdir}/goenv.sh":
      ensure => absent,
    }

    $chgo_auto_ensure = $auto_switch ? {
      true    => present,
      default => absent,
    }

    boxen::env_script {
      'go':
        content  => template('go/env.sh.erb'),
        priority => 'higher' ;
      'chgo_auto':
        ensure   => $chgo_auto_ensure,
        content  => "source \$CHGO_ROOT/share/chgo/auto.sh\n",
        priority => 'lowest' ;
    }
  }

  repository { $chgo_root:
    ensure => $chgo_version,
    force  => true,
    source => $chgo_source,
    user   => $chgo_user,
  }

  repository { $goenv_root:
    ensure => absent,
  }
}
