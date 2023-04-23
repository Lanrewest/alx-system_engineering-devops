#package install a package

package { 'puppet-lint':
  ensure  => present,
}
package { 'python3-pip':
  ensure => 'installed',
}

exec { 'update pip3':
  command => '/usr/bin/pip3 install --upgrade pip',
}

exec { 'install flask':
  command => '/usr/bin/pip3 install flask==2.1.0',
  path    => '/usr/local/bin:/usr/bin:/bin',
  unless  => '/usr/bin/pip3 show flask | grep -q "Version: 2.1.0"',
}

