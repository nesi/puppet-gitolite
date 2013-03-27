class gitolite::install(
  $user,
  $group,
  $groups,
  $base_dir,
  $repo_dir,
  $git_url,
  $shell,
  $provider
) {

  # NOTE: Wrapping these definitions with if defined statements as they may
  # have been previously defined and set up, by dynaguppy for example
  # It is recommended that the user is managed outside this module!

  if ! defined(File[$base_dir]){
    file{$base_dir:
      ensure    => directory,
      owner     => $user,
    }
  }

  if ! defined(File[$repo_dir]){
    file{$repo_dir:
      ensure    => directory,
      owner     => $user,
      require   => File[$base_dir],
    }
  }

  if ! defined(User[$user]){
    user{$user:
      ensure      => present,
      gid         => group,
      groups      => $groups,
      shell       => $shell,
      home        => $base_dir,
      managehome  => false,
      require     => File[$base_dir],
    }
  }

  if ! defined(Git::User['$user']){
    git::user{$user: }
  }


  # It is recommended that a user's SSH key is managed outside this module
  # this is included to ensure that this module runs out-of-the-box

  exec{"${user}_keygen":
    user      = $user,
    path      = ['/usr/bin'],
    command   = "ssh-keygen -t rsa -N "" -C '${user}@${::fqdn}'",
    creates   = "${base_dir}/.ssh/id_rsa.pub",
  }

}