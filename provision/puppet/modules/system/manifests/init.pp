class system (
  $packages = [
    "libaio1",
  ],
  $model = 'pc105',
  $layout = 'no',
  $variant = '',
  $options = '',
  $backspace = 'guess',
  $configuration_script = "/home/vagrant/.configure.sh",
  $alias_rc = "/home/vagrant/.aliases"
  ) {

  exec { "system-apt-update":
    command => "apt update",
  }

  exec { "system-apt-upgrade":
    command => "apt --yes upgrade",
    require => Exec["system-apt-update"]
  }

  package { $packages:
    ensure => "installed",
    require => Exec["system-apt-update"],
  }

  package { "install-rng-tools":
    name => "rng-tools",
    ensure => "installed",
    require => Exec["system-apt-update"],
  }

  exec { "enable-urandom":
    command => "echo 'HRNGDEVICE=/dev/urandom' >> /etc/default/rng-tools",
    require => Package["install-rng-tools"],
  }

  exec { "start-rng-tool":
    command => "/etc/init.d/rng-tools start",
    require => Exec["enable-urandom"],
  }

  file { '/home/vagrant/dev':
    ensure => 'directory',
    replace => 'no',
    owner  => 'vagrant',
    group  => 'vagrant'
  }

  file { "commmonrc":
    path => $configuration_script,
    source => "puppet:///modules/system/configure.sh",
    mode => "0755",
    replace => 'no',
    owner => "vagrant",
    group => "vagrant"
  }

    file { "alias_rc":
    path => $alias_rc,
    source => "puppet:///modules/system/alias.sh",
    mode => "0755",
    replace => 'no',
    owner => "vagrant",
    group => "vagrant"
  }

  exec { "add-alias-rc":
    cwd => "/home/vagrant",
    command => "echo 'source ~/.aliases' >> .bashrc",
    require => File["alias_rc"]
  }


  exec { "add-common-bash":
    cwd => "/home/vagrant",
    command => "echo 'source ~/.configure.sh' >> .bashrc",
    require => File["commmonrc"]
  }
}
