#package install a package

package { 'puppet-lint':
  ensure  => present,
}
package { 'python3-pip':
  ensure => 'installed',
}

exec { 'install flask':
  command => '/usr/bin/pip3 install flask==2.1.0',
  unless  => '/usr/bin/pip3 show flask | grep -q "Version: 2.1.0"',
}

