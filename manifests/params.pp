class gitolite::params {
  $user     = 'gitolite'
  $group    = 'gitolite'
  $base_dir = '/home/gitolite'
  $repo_dir = "${base_dir}/repositories"
  $git_url  = 'git://github.com/sitaramc/gitolite.git'

  case $::operatingsystem{
    fedora,redhat,centos: {
      $package        = 'gitolite'
      $dep_packages   = ['git','perl-Error','perl-Git']
    }
    debian,ubuntu{
      $package        = 'gitolite'
      $dep_packages   = ['git']
    }
    default:{
      fail('The gitolite module is not configured fro ${::operatingsystem} on ${::fqdn}')
    }
  }

}