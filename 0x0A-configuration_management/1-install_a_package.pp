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

package { 'libxml2-dev':
  ensure => 'installed',
}

package { 'libxslt1-dev':
  ensure => 'installed',
}

exec { 'install markupsafe':
  command => '/usr/bin/pip3 install markupsafe',
  unless  => '/usr/bin/pip3 show markupsafe',
}

exec { 'install flask':
  command => '/usr/bin/pip3 install flask==2.1.0',
  path    => '/usr/local/bin:/usr/bin:/bin',
  unless  => '/usr/bin/pip3 show flask | grep -q "Version: 2.1.0"',
}


