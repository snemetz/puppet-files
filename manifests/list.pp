# = Define: files::list
#
# Realize a file entry or list
#
define files::list {
  $list = hiera("files_list_${name}", '')
  #$list = params_lookup("files_list_${name}", 'global')
  #$list = params_lookup("list_${name}")
  if $list != '' {
    files::list { $list:; }
  } else {
    files::real { $name:; }
  }
}
