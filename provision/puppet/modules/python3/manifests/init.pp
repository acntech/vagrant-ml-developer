class python3 () {

    package { "install-pip":
    name => "python3-pip",
    ensure => "latest",
  }

  package { "install-venv":
    name => "python3-venv",
    ensure => "latest",
    require => Package["install-pip"],
  }

}
