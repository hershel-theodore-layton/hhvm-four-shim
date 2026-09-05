# hhvm-four-shim

_Supporting HHVM 4 for as long as possible._

## Branch

You are currently looking at the hhvm@next (6 and above) branch of this repository.

## Why is this needed?

HTL software supports a large range of HHVM versions. Older HHVM versions need
some arcane incantations that newer HHVM versions do not support anymore. This
library allows me to provide two definitions for one function, and load the right
one based on your reported HHVM version.

For example, `varray(...)` is not supported on hhvm@next, but required to be
used in some edge cases on HHVM version 4.102. `downgrade_vecish` is an
alternate spelling for `varray(...)` on HHVM 4 and for `vec(...)` on HHVM 6.

## Future of HHVM 4 support

I wanted to add support for hhvm@next to HTL, without removing unofficial
support for HHVM versions 4.102 through 4.151 in the same release. This library
allows me to do that. On September 1st 2025, I will drop unofficial support for
HHVM version 4.151 and below. This library will stick around to support
HHVM versions 4.153 through 4.168 for a while. It is unclear at this time when
support for these versions will be dropped.
