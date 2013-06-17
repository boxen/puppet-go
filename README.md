# Go Puppet Module for Boxen

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
