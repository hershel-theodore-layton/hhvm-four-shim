/** hhvm-four-shim is MIT licensed, see /LICENSE */
namespace HTL\HH4Shim;

use namespace HH;

/**
 * Returns `dict<_, _>` on hhvm 4.103+.
 * Returns `darray<_, _>` on hhvm 4.102.
 */
function array_to_shape(mixed $array)[]: mixed {
  invariant(
    HH\is_dict_or_darray($array),
    'Expected a shape, got %s',
    \gettype($array)
  );
  return darray($array);
}

/**
 * Returns `vec<_>` on hhvm 4.103+.
 * Returns `varray<_>` on hhvm 4.102.
 */
function array_to_tuple(mixed $array)[]: mixed {
  invariant(
    HH\is_vec_or_varray($array),
    'Expected a tuple, got %s',
    \gettype($array)
  );
  return varray($array);
}

/**
 * Like array_to_shape, but the type information is retained.
 */
function downgrade_dictish(dict<Tk, Tv> $dict)[]: AnyArray<Tk, Tv> {
  return darray($dict);
}

/**
 * Like array_to_tuple, but the type information is retained.
 */
function downgrade_vecish(vec<T> $vec)[]: AnyArray<int, T> {
  return varray($vec);
}

/**
 * Returns true for `darray<_, _>` and `dict<_, _>`.
 */
function is_dictish(mixed $mixed)[]: bool {
  return HH\is_dict_or_darray($mixed);
}

/**
 * Returns true for `varray<_>` and `vec<_>`.
 */
function is_vecish(mixed $mixed)[]: bool {
  return HH\is_vec_or_varray($mixed);
}
