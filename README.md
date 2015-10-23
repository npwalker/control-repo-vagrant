# How to use this stack

This stack bootstraps itself by

1. Installing with an answer file that configures r10k to connect to my npwalker/control-repo on github
2. Running r10k
3. Running puppet agent -t

In order to follow the instructions in npwalker/control-repo you need to clean up some stuff

1.  Remove r10k_remote from the puppet_enterprise::profile::master class in the PE master group of the console
2.  remove the remote from r10k.yaml ( mostly so you don't erronously think you've done something right when really it's just pulling from my repo )
3.  `rm -rf rm -rf /opt/puppetlabs/server/data/puppetserver/r10k/*`

# This Vagrant Stack is Based on the puppet-debugging-kit

Please follow the setup instructions for the debugging kit before cloning down this repo.

https://github.com/Sharpie/puppet-debugging-kit
