# hhvm-four-shim

_Supporting hhvm 4 for as long as possible._

## Branch

You are currently looking at the hhvm version 4 branch of this repository.

## Why is this needed?

HTL software supports a large range of hhvm versions. Older hhvm versions need
some arcane incantations that newer hhvm versions do not support anymore. This
library allows me provide two definitions for one function, and load the right
one based on your reported hhvm version.

For example, `varray(...)` is not supported on hhvm@next, but required to be
used in some edge cases on hhvm version 4.102. `downgrade_vecish` is an
alternate spelling for `varray(...)` on hhvm 4 and for `vec(...)` on hhvm 6.

## Future of hhvm 4 support

I wanted to add support for hhvm@next to HTL, without removing unofficial
support for hhvm version 4.102 through 4.151 in the same release. This library
allows me to do that. On September 1st 2025, I will drop unofficial support for
hhvm version 4.151 and below. This library will stick around to support
hhvm version 4.153 through 4.168 for a while. It is unclear at this time when
support for these versions will be dropped.
