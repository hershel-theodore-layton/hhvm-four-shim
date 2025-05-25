/** hhvm-four-shim is MIT licensed, see /LICENSE */
namespace HTL\HH4Shim;

/**
 * Newer hh_client versions know more about the type of the values in your
 * program. It complains about useless `as`, which are required to satisfy older
 * versions of hh_client. By casting to `mixed` on all platforms first, we can
 * keep performing the `as` cast that newer hh_client versions would have
 * considered useless.
 */
function to_mixed(mixed $mixed)[]: mixed {
  return $mixed;
}
