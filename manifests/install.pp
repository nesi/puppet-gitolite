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

}