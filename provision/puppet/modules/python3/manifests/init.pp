class python3 ($packages = [
    "make", "build-essential", "libssl-dev",
    "zlib1g-dev", "libbz2-dev", "libreadline-dev", "wget", "curl", "llvm",
    "libncursesw5-dev",  "xz-utils", "tk-dev", "libxml2-dev", "libxmlsec1-dev", "libffi-dev", "liblzma-dev", "sqlite3", "libsqlite3-dev"
     ],
    $pyenv_script = "/home/vagrant/.pyenv.sh", 
  ) ) {

  package { "install-pip":
    name => "python3-pip",
    ensure => "latest",
  }

  package { "install-venv":
    name => "python3-venv",
    ensure => "latest",
    require => Package["install-pip"],
  }

  {
  package { $packages:
    ensure => "installed",
    require => Package["install-venv"],
    
  }
    exec { "install-pyenv":
    user => "vagrant",
    cwd => "/home/vagrant",
    environment => ['HOME=/home/vagrant'],
    creates => '/home/vagrant/.pyenv',
    command => 'sh -c "curl https://pyenv.run | bash"',
    require => Package[$packages]  
  }

    file { "pyenvscript":
    path => $pyenv_script,
    source => "puppet:///modules/python3/pyenv.sh",
    mode => "0755",
    replace => 'no',
    owner => "vagrant",
    group => "vagrant"
  }

   exec { "update-profile":
    user => "vagrant",
    cwd => "/home/vagrant",
    environment => ['HOME=/home/vagrant'],
    command => '/home/vagrant/.pyenv.sh && rm /home/vagrant/.pyenv.sh',
    require => File["pyenvscript"]  
  }


}
