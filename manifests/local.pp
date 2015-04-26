# Set a directory's default go version via chgo.
# Automatically ensures that go version is installed via chgo.
#
# Usage:
#
#     go::local { '/path/to/a/thing': version => '1.9.3-p194' }

define go::local($version = undef, $ensure = present) {
  validate_re($ensure, '^(present|absent)$',
    "Go::Local[${name}] ensure must be present|absent, is ${ensure}")

  validate_absolute_path($name)

  if $ensure == present {
    ensure_resource('go::version', $version, {ensure => present})
  }

  file { "${name}/.go-version":
    ensure  => $ensure,
    content => "${version}\n",
    replace => true,
  }
}
