# hhvm-four-shim

_Supporting HHVM 4 for as long as possible._

## Versions and package selection

| HHVM version | Implementation branch | Package constraint |
| --- | --- | --- |
| HHVM 4 | `backports` (`hhvm ^4`) | `^0.4` |
| HHVM after 4 | `master` (`hhvm >=5`) | `^0.6` |

To support both families, require
`"hershel-theodore-layton/hhvm-four-shim": "^0.4 || ^0.6"`.
[Composer](https://getcomposer.org/doc/01-basic-usage.md) selects the package
line during dependency resolution using the reported HHVM version; there is
no runtime switch. `^0.6` alone cannot resolve on HHVM 4.

The [master CI matrix](.github/workflows/build-and-test.yml) lists the tested
HHVM versions; Composer's broader requirement does not imply testing.

## Why is this needed?

The two package lines provide a common API for HTL across HHVM versions.
For example, `downgrade_vecish` uses `varray(...)` on HHVM 4 and returns the
input `vec` unchanged on `master`.

## Legacy HHVM 4 support

The announced cutoff for unofficial HTL support for HHVM 4.151 and below was
September 1, 2025. HHVM 4.153 through 4.168 remain legacy support targets with
no announced end date. Backports still accepts older versions through `^4`;
installability does not imply continued support.
