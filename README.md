# Go Puppet Module for Boxen

[![Build Status](https://travis-ci.org/boxen/puppet-go.png?branch=master)](https://travis-ci.org/boxen/puppet-go)

## Usage

```puppet
include go

go::version { '1.1.1': }

include go::1_1

go::local { '/path/to/whatever':
  version => '1.1.1'
}
```

## Required Puppet Modules

* `boxen`
* `repository`
* `stdlib`
