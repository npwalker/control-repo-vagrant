
file { '/etc/puppetlabs/puppetserver/ssh' :
  ensure => directory,
  owner  => 'pe-puppet',
  group  => 'pe-puppet',
}

file { [ '/etc/puppetlabs/puppetserver/code_manager.key', '/etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa' ]:
  ensure => present,
  source => '/vagrant/ssh_key/code_manager.key',
  owner  => 'pe-puppet',
  group  => 'pe-puppet',
}

file { [ '/etc/puppetlabs/puppetserver/code_manager.key.pub', '/etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa.pub' ] :
  ensure => present,
  source => '/vagrant/ssh_key/code_manager.key.pub',
  owner  => 'pe-puppet',
  group  => 'pe-puppet',
}
