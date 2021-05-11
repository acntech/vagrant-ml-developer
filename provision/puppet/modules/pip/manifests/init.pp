class pip (
  $pip_requirements_file = "/home/vagrant/requirements.txt",
  $jupyter_requirements = ["notebook", "jupytext"],
  $jupyter_config = "/home/vagrant/.jupyter/jupyter_notebook_config.py"
  ) {

  exec { "upgrade-pip":
    command => "python3 -m pip install --upgrade pip"
  }

  package { $jupyter_requirements:
    ensure => "latest",
    provider => "pip3",
    require => File["add-pip-requirements"],
  }

  file { '/home/vagrant/.jupyter':
    ensure => 'directory',
    replace => 'no',
    owner  => 'vagrant',
    group  => 'vagrant',
    require => Package[$jupyter_requirements]
  }

  file { "configure-jupyter":
    path => $jupyter_config,
    source => "puppet:///modules/pip/jupyter_notebook_config.py",
    replace => 'no',
    owner => "vagrant",
    group => "vagrant",
    require => File["/home/vagrant/.jupyter"]
  }

  file { "add-pip-requirements":
    path => $pip_requirements_file,
    source => "puppet:///modules/pip/requirements.txt",
    replace => 'no',
    owner => "vagrant",
    group => "vagrant",
    require => Exec["upgrade-pip"]
  }  
   exec { "install-poetry":
    require => Exec["upgrade-pip"],
    user => "vagrant",
    command => "curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -", 
    environment => [ 'HOME=/home/vagrant' ]
  }
}
