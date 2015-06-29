# = Define: files::virtual
#
define files::virtual {
  if is_string($name) {
    # This should be a hash key
    if is_hash($files::files_defs[$name]) {
      # Build resource variables
      # Required
      #   content or source
      #   path
      if $files::files_defs[$name]['source'] != '' {
        $source = "puppet:///modules/${files::files_defs[$name]['source']}"
      } elsif $files::files_defs[$name]['content'] != '' {
        $content = $files::files_defs[$name]['content']
      } else {
        fail('ERROR: file content or source is required')
      }
      if $files::files_defs[$name]['path'] != '' {
        $path = $files::files_defs[$name]['path']
      } else {
        fail('ERROR: file path is required')
      }
      if $files::files_defs[$name]['backup'] != '' {
        $backup = $files::files_defs[$name]['backup']
      } else {
        $backup = $files::backup
      }
      if $files::files_defs[$name]['ensure'] != '' {
        $ensure = $files::files_defs[$name]['ensure']
      } else {
        $ensure = $files::ensure
      }
      if $files::files_defs[$name]['force'] != '' {
        $force = $files::files_defs[$name]['force']
      } else {
        $force = $files::force
      }
      if $files::files_defs[$name]['group'] != '' {
        $group = $files::files_defs[$name]['group']
      } else {
        $group = $files::group
      }
      if $files::files_defs[$name]['ignore'] != '' {
        $ignore = $files::files_defs[$name]['ignore']
      } else {
        $ignore = $files::ignore
      }
      if $files::files_defs[$name]['links'] != '' {
        $links = $files::files_defs[$name]['links']
      } else {
        $links = $files::links
      }
      if $files::files_defs[$name]['mode'] != '' {
        $mode = $files::files_defs[$name]['mode']
      } else {
        $mode = $files::mode
      }
      if $files::files_defs[$name]['owner'] != '' {
        $owner = $files::files_defs[$name]['owner']
      } else {
        $owner = $files::owner
      }
      if $files::files_defs[$name]['purge'] != '' {
        $purge = $files::files_defs[$name]['purge']
      } else {
        $purge = $files::purge
      }
      if $files::files_defs[$name]['recurse'] != '' {
        $recurse = $files::files_defs[$name]['recurse']
      } else {
        $recurse = $files::recurse
      }
      if $files::files_defs[$name]['recurselimit'] != '' {
        $recurselimit = $files::files_defs[$name]['recurselimit']
      } else {
        $recurselimit = $files::recurselimit
      }
      if $files::files_defs[$name]['replace'] != '' {
        $replace = $files::files_defs[$name]['replace']
      } else {
        $replace = $files::replace
      }
      if $files::files_defs[$name]['sourceselect'] != '' {
        $sourceselect = $files::files_defs[$name]['sourceselect']
      } else {
        $sourceselect = $files::sourceselect
      }
      if $files::files_defs[$name]['target'] != '' {
        $target = $files::files_defs[$name]['target']
      } else {
        $target = $files::target
      }

      # Define file
      file { $name:
        ensure       => $ensure,
        backup       => $backup,
        content      => $content,
        force        => $force,
        group        => $group,
        ignore       => $ignore,
        links        => $links,
        mode         => $mode,
        owner        => $owner,
        path         => $path,
        purge        => $purge,
        recurse      => $recurse,
        #recurselimit => $recurselimit,
        replace      => $replace,
        source       => $source,
        sourceselect => $sourceselect,
        target       => $target,
      }
    } else {
      notify{ "${name} is not a key to a hash":}
    }
  } else {
    notify{"${name} is not a string":}
  }
}
