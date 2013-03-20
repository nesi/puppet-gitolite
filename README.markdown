# gitolite

This Puppet module installs and manages the gitolite git repository service.

# To install into puppet

Clone into your puppet configuration in your `puppet/modules` directory:

 git clone git://github.com/nesi/puppet-gitolite.git gitolite

Or if you're managing your Puppet configuration with git, in your `puppet` directory:

```
git submodule add git://github.com/nesi/puppet-gitolite.git modules/gitolite --init --recursive
cd modules/gitolite
git checkout master
git pull
cd ../..
git commit -m "added gitolite submodule from https://github.com/nesi/puppet-gitolite"
```

It might seem bit excessive, but it will make sure the submodule isn't headless...

# Dependencies

The gitolite puppet module is depenent on:

* [stdlib][2]
* [nesi/git][1] the NeSI Git puppet module

[1]:https://github.com/nesi/puppet-git
[2]:https://github.com/puppetlabs/puppetlabs-stdlib

# Intent

It is indended that this Puppet module will interoperate with:

* [Gitlab][3] a web interface compatible with gitolite
* [dynaguppy][4] including that whole git integrated dynamic puppet environments thing.
* [nesi/puppet-puppet][5] a Puppet module for puppet

[3]:http://gitlab.org/
[4]:https://github.com/Aethylred/dynaguppy
[5]:https://github.com/nesi/puppet-puppet

# References
*
* Git http://git-scm.com/
* gitolite https://github.com/sitaramc/gitolite

## Acknowledgement

I have taken inspiration and ideas from the following other gitolite puppet modules:

* https://github.com/GregSutcliffe/puppet-gitolite
* https://github.com/jfryman/puppet-gitolite
* https://github.com/huit/puppet-gitolite

# Attribution

This module was written by Aaron Hicks (hicksa@landcareresearch.co.nz) for the New Zealand eScience Infrastructure project (http://nesi.org.nz).

This module is derived from the puppet-blank module by Aaron Hicks (aethylred@gmail.com)

* https://github.com/Aethylred/puppet-blank

This module has been developed for the use with Open Source Puppet (Apache 2.0 license) for automating server & service deployment.

* http://puppetlabs.com/puppet/puppet-open-source/

# Gnu General Public License

This file is part of the gitolite Puppet module.

The gitolite Puppet module is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

The gitolite Puppet module is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with the gitolite Puppet module.  If not, see <http://www.gnu.org/licenses/>.