# = Class: files
#
# Wrapper for file type to provide data driven file management
#
# TODO:
#   need to rewrite to bring up to current standards
#   change to use 3.x parameter hiera auto lookups
#
# == Author
#  Steven Nemetz
#
#class files inherits files::params {
class files {
  include files::params
  $files_defs = hiera('files_defs')
  $files_keys = keys($files_defs)
  if is_array($files_keys) {
    # Defaults
    $ensure       = hiera('files_default_ensure', $files::params::ensure)
    $backup       = hiera('files_default_backup', $files::params::backup)
    $force        = hiera('files_default_force',  $files::params::force)
    $group        = hiera('files_default_group',  $files::params::group)
    $ignore       = hiera('files_default_ignore', $files::params::ignore)
    $mode         = hiera('files_default_mode',   $files::params::mode)
    $owner        = hiera('files_default_owner',  $files::params::owner)
    $purge        = hiera('files_default_purge',  $files::params::purge)
    $recurse      = hiera('files_default_recurse', $files::params::recurse)
    $recurselimit = hiera('files_default_recurselimit', $files::params::recurselimit)
    $replace      = hiera('files_default_replace', $files::params::replace)
    $sourceselect = hiera('files_default_sourceselect', $files::params::sourceselect)

    # Create virtual file definitions
    @files::virtual { $files_keys:; }
  } else {
    notify { "FILES not array of hash keys ${files_keys} --- ${files_defs}": }
  }
  # Realize the default files list
  files::list{'default':}
}
