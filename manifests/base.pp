# ensure that we have a puppet user
group { "puppet": ensure => "present", }

# set a fully qualified domain name
exec  { "set hostname":
  command => 'hostname vagrant.start',
  path    => '/bin',
}

# use the fully qualified domain name to setup the /etc/hosts file
host  { 'self':
  ensure       => present,
  name         => $fqdn,
  host_aliases => [$hostname],
  ip           => $ipaddress,
  require      => Exec['set hostname'],
}

# sane base ~/.bash_profile
file { "/home/vagrant/.bash_profile":
  ensure  => "present",
  content => ". ~/.bashrc\nset -o vi\nEDITOR=vim",
  owner   => "vagrant",
  group   => "vagrant",
  mode    => 600,
}

# MariaDB sources.list entry
file { "/etc/apt/sources.list.d/mariadb.list":
  ensure  => "present",
  content => "
# MariaDB 5.5 repository list - created 2012-10-18 04:40 UTC
# http://downloads.mariadb.org/mariadb/repositories/
deb http://ftp.osuosl.org/pub/mariadb/repo/5.5/ubuntu precise main
deb-src http://ftp.osuosl.org/pub/mariadb/repo/5.5/ubuntu precise main
  ",
  owner   => "vagrant",
  group   => "vagrant",
  mode    => 600,
}

# import signing key
exec  { "import":
  command => 'apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 1BB943DB',
  path    => '/usr/bin',
  require => File["/etc/apt/sources.list.d/mariadb.list"],
}

# update apt packages
exec  { "update":
  command => 'apt-get update',
  path    => '/usr/bin',
  require => Exec["import"],
}

# required packages
package { "mariadb-server-5.5":
  ensure  => present,
  require => Exec["update"]
}
package { "vim-nox": ensure => present }

# required services
service { "mysql":
  ensure      => "running",
  enable      => "true",
  hasstatus   => true,
  hasrestart  => true,
  require     => Package["mariadb-server-5.5"],
}
