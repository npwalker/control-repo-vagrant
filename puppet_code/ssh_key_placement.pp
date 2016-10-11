
file { '/vagrant/ssh_key' :
  ensure => directory,
}

$code_manager_ssh_key_file = '/vagrant/ssh_key/code_manager.key'

exec { 'create vagrant ssh key' :
      command => "/usr/bin/ssh-keygen -t rsa -b 2048 -C 'code_manager' -f ${code_manager_ssh_key_file} -q -N ''",
      creates => $code_manager_ssh_key_file,
      require => File['/vagrant/ssh_key'],
    }

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
