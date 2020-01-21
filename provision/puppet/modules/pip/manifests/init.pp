class pip (
  $pip_requirements = "/home/vagrant/requirements.txt",
  $jupyter_config = "/home/vagrant/.jupyter/jupyter_notebook_config.py"
  ) {

    exec { "upgrade-pip":
    command => "python3 -m pip install --upgrade pip"
  }

  file { "add-pip-requirements":
    path => $pip_requirements,
    source => "puppet:///modules/pip/requirements.txt",
    owner => "vagrant",
    group => "vagrant",
    require => Exec["upgrade-pip"]
  }

   exec { "install-requirements":
    command => "python3 -m pip install -r ${pip_requirements}",
    require => File["add-pip-requirements"]
     }

    
    file { '/home/vagrant/.jupyter':
    ensure => 'directory',
    replace => 'no',
    owner  => 'vagrant',
    group  => 'vagrant',
    require => Exec["install-requirements"]
  }
    
    
    file { "configure-jupyter":
    path => $jupyter_config,
    source => "puppet:///modules/pip/jupyter_notebook_config.py",
    replace => 'no',
    owner => "vagrant",
    group => "vagrant",
    require => File["/home/vagrant/.jupyter"]
  }

    
 
}
