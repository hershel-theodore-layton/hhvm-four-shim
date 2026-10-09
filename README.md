# hhvm-four-shim

_Supporting HHVM 4 for as long as possible._

## Versions and package selection

This is the `master` branch for newer HHVM versions. Its Composer requirement
is `hhvm >=5`; the corresponding releases are `0.6.x`.

| HHVM version | Implementation branch | Package constraint |
| --- | --- | --- |
| HHVM 4 | `backports` (`hhvm ^4`) | `^0.4` |
| HHVM 5 and above | `master` (`hhvm >=5`) | `^0.6` |

Applications that support both families can require
`"hershel-theodore-layton/hhvm-four-shim": "^0.4 || ^0.6"`.
[Composer](https://getcomposer.org/doc/01-basic-usage.md) selects a compatible
package release during dependency resolution using the reported HHVM platform
version and the application's constraints. A constraint of `^0.6` alone cannot
resolve on HHVM 4. An existing lock file keeps its selected release until an
update; this checkout does not switch implementations at runtime.

The current [master CI matrix](.github/workflows/build-and-test.yml) checks HHVM
25.6.0, 25.7.0, 25.11.0, 26.03.28, 26.06.05, 26.09.29, and beta. Composer
accepting other versions at or above 5 does not establish that they have been
tested. HHVM 4 is handled separately on `backports`.

## Why is this needed?

HTL software supports a large range of HHVM versions. Older HHVM versions need
some arcane incantations that newer HHVM versions do not support anymore. This
library provides the same function names in two package lines, so applications
can use a common API across HHVM versions.

For example, `varray(...)` is not supported on hhvm@next, but required to be
used in some edge cases on HHVM version 4.102. `downgrade_vecish` is an
alternate spelling for `varray(...)` on the HHVM 4 package line; on `master`,
it returns the input `vec` unchanged.

## Legacy HHVM 4 support

I wanted to add support for hhvm@next to HTL, without removing unofficial
support for HHVM versions 4.102 through 4.151 in the same release. This library
allows me to do that. The announced cutoff for unofficial HTL support for
HHVM 4.151 and below was September 1, 2025. HHVM 4.153 through 4.168 are
the remaining legacy support targets; no end date has been announced here.
The `^4` requirement in the backports package line still accepts older HHVM 4
versions, so package installability alone is not a promise of continued support.
