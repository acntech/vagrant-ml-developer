class python3 () {

    package { "install-pip":
    name => "python3-pip",
    ensure => "installed",
  }

  package { "install-venv":
    name => "python3-venv",
    ensure => "installed",
    require => Package["install-pip"],
  }

}
