class git {

  package { "install-git":
    name => "git",
    ensure => "installed",
  }

  package { "install-git-flow":
    name => "git-flow",
    ensure => "installed",
    require => Package["install-git"],
  }

  package { "install-git-lfs":
    name => "git-lfs",
    ensure => "installed",
    require => Package["install-git"],
  }

  file { "add-git-config":
    path => "/home/vagrant/.gitconfig",
    source => "puppet:///modules/git/gitconfig",
    owner => "vagrant",
    group => "vagrant",
  }

  exec { "init-git-lfs":
    command => "git lfs install",
    user => "vagrant",
    environment =>  ['HOME=/home/vagrant'],
    require => File["add-git-config"]
    }
}
