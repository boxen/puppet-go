# Set a directory's default go version via goenv.
# Automatically ensures that go version is installed via goenv.
#
# Usage:
#
#     go::local { '/path/to/a/thing': version => '1.9.3-p194' }

define go::local($version = undef, $ensure = present) {
  validate_re($ensure, '^(present|absent)$',
    "Go::Local[${name}] ensure must be present|absent, is ${ensure}")

  validate_absolute_path($name)

  if $ensure == present {
    $klass = join(['go', join(split($version, '[.]'), '_')], '::')
    require $klass
  }

  file { "${name}/.go-version":
    ensure  => $ensure,
    content => "${version}\n",
    replace => true,
  }
}
