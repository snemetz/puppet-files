# = Class: files::params
#
# Default variables
#
class files::params {
  $ensure       = 'present'
  $backup       = 'main'
  $content      = undef
  $force        = 'false'
  $group        = '0'
  $ignore       = undef
  $links        = undef
  $mode         = undef
  $owner        = '0'
  $path         = undef
  $purge        = 'false'
  $recurse      = 'false'
  $recurselimit = '0'
  $replace      = 'true'
  $source       = undef
  $sourceselect = 'first'
  $target       = undef
}
