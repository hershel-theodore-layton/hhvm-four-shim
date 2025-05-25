# hhvm-four-shim

_Supporting hhvm 4 for as long as possible._

This might not work, but I will try.

## Installation

If you can depend on `"require": { "hhvm/hhvm": ">=5" }` handling from composer.
You can simply `composer require` this library and be on your merry way. If
you use `--ignore-platform-reqs`, you must pin a version. The `0.4.x` range
contains backports for hhvm 4, and the `0.6.x` range contains forward compatible
implementations for hhvm@next.

## Development

There are two branches available, both must stay in sync.

- [master](https://github.com/hershel-theodore-layton/hhvm-four-shim/tree/master)
  The place where the hhvm 6 code is being developed.
- [backports](https://github.com/hershel-theodore-layton/hhvm-four-shim/tree/backports)
  The place where the hhvm 4 code is being developed.
