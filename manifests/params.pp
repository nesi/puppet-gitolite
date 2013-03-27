class gitolite::params {
  $user     = 'gitolite'
  $group    = 'gitolite'
  $base_dir = '/home/gitolite'
  $repo_dir = "${base_dir}/repositories"
  $git_url  = 'git://github.com/sitaramc/gitolite.git'
  $shell    = '/bin/bash'
  $ssh_key  = "${base_dir}/.ssh/id_rsa.pub"

  case $::operatingsystem{
    fedora,redhat,centos: {
      $package        = 'gitolite'
      $dep_packages   = ['git','perl-Error','perl-Git']
      $bin_dir        = '/usr/bin'
    }
    debian,ubuntu{
      $package        = 'gitolite'
      $dep_packages   = ['git']
      $bin_dir        = '/usr/bin'
    }
    default:{
      fail('The gitolite module is not configured fro ${::operatingsystem} on ${::fqdn}')
    }
  }

}