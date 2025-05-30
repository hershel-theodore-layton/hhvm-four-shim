/** hhvm-four-shim is MIT licensed, see /LICENSE */
namespace HTL\HH4Shim;

/**
 * Returns `dict<_, _>` on hhvm 4.103+.
 * Returns `darray<_, _>` on hhvm 4.102.
 */
function array_to_shape(mixed $array)[]: mixed {
  invariant($array is dict<_, _>, 'Expected a shape, got %s', \gettype($array));
  return $array;
}

/**
 * Returns `vec<_>` on hhvm 4.103+.
 * Returns `varray<_>` on hhvm 4.102.
 */
function array_to_tuple(mixed $array)[]: mixed {
  invariant($array is vec<_>, 'Expected a tuple, got %s', \gettype($array));
  return $array;
}

/**
 * Like array_to_shape, but the type information is retained.
 */
function downgrade_dictish<Tk as arraykey, Tv>(
  dict<Tk, Tv> $dict
)[]: AnyArray<Tk, Tv> {
  return $dict;
}

/**
 * Like array_to_tuple, but the type information is retained.
 */
function downgrade_vecish<T>(vec<T> $vec)[]: AnyArray<int, T> {
  return $vec;
}

/**
 * Returns true for `darray<_, _>` and `dict<_, _>`.
 */
function is_dictish(mixed $mixed)[]: bool {
  return $mixed is dict<_, _>;
}

/**
 * Returns true for `varray<_>` and `vec<_>`.
 */
function is_vecish(mixed $mixed)[]: bool {
  return $mixed is vec<_>;
}
