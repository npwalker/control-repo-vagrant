
file { '/etc/puppetlabs/puppetserver/code_manager.key':
  ensure => present,
  source => '/vagrant/ssh_key/code_manager.key',
  owner  => 'pe-puppet',
  group  => 'pe-puppet',
}
