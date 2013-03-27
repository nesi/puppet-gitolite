# Class: gitolite
#
# This module manages gitolite
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#

# This file is part of the gitolite Puppet module.
#
#     The gitolite Puppet module is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     The gitolite Puppet module is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with the gitolite Puppet module.  If not, see <http://www.gnu.org/licenses/>.

# [Remember: No empty lines between comments and class definition]
class gitolite (
  $user     = $gitolite::params::user,
  $group    = $gitolite::params::user,
  $groups   = [],
  $base_dir = $gitolite::params::base_dir,
  $repo_dir = $gitolite::params::repo_dir,
  $git_url  = $gitolite::params::git_url,
  $shell    = $gitolite::params::shell,
  $provider = 'package',
  $ssh_key  = $gitolite::params::ssh_key
) inherits git::params {

  require git

  validate_string($user,$group,$base_dir,$repo_dir,$git_url,$provider,$ssh_key)
  validate_re($provider,['^package','^git'])

  # any other parameter validation & manipulation should happen here

  class {'gitolite::install':
    user      => $user,
    group     => $group,
    groups    => $groups,
    base_dir  => $base_dir,
    repo_dir  => $repo_dir,
    git_url   => $git_url,
    shell     => $shell,
    provider  => $provider,
    ssh_key   => $ssh_key,
  }

}
