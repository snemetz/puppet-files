# = Define: files::real
#
# Realize a file entry
#
define files::real {
  realize ( Files::Virtual[ $name ] )
}
