#One-time Setup

The first time you use this stack you need to setup the puppetlabs/control-repo in your gitlab server.

Outline of steps:

1. On your laptop, inside this directory run:
 - `mkdir ssh_key; /usr/bin/ssh-keygen -t rsa -b 2048 -C 'code_manager' -f ssh_key/code_manager.key -q -N ''`
 - This is necessary so that the puppet-masters can move this key into place and use it to connect to gitlab
1. `vagrant up puppet-master-ankeny; vagrant up gitlab-server-ankeny`
2. Login into the gitlab UI via the ip address assigned to your vagrant instance
 - I recommend added this to your local hosts file so you can easily access the interface in the future
3. Follow the instructions in puppetlabs/control-repo to get everything setup in gitlab
 - https://github.com/puppetlabs/control-repo#copy-this-repo-into-your-own-git-server
3. Add the ssh key you just made as a deploy key on the puppet/control-repo in gitlab
4. Once you have completed these steps I recommend snapshotting the gitlab server so you can always get back to this state

# How to use this stack

This stack bootstraps itself by

1. Installing with an answer file that configures r10k/code manager to connect to the puppet/control-repo on the local gitlab server
2. Running r10k
3. Using the pe_git_webhook module to set everything up and then running puppet a few more times


# This Vagrant Stack is Based on the puppet-debugging-kit

Please follow the setup instructions for the debugging kit before cloning down this repo.

https://github.com/Sharpie/puppet-debugging-kit
