class pip (
  $pip_requirements_file = "/home/vagrant/requirements.txt",
  $pip_requirements = ["tensorflow", "numpy", "pandas", "jupyter" "flask", "scikit-learn"],
  $jupyter_config = "/home/vagrant/.jupyter/jupyter_notebook_config.py"
  ) {

    exec { "upgrade-pip":
    command => "python3 -m pip install --upgrade pip"
  }

  file { "add-pip-requirements":
    path => $pip_requirements_file,
    source => "puppet:///modules/pip/requirements.txt",
    owner => "vagrant",
    group => "vagrant",
    require => Exec["upgrade-pip"]
  }

    package { $pip_requirements:
    ensure => "latest",
    provider => "pip3",
    require => File["add-pip-requirements"],
  }


    file { '/home/vagrant/.jupyter':
    ensure => 'directory',
    replace => 'no',
    owner  => 'vagrant',
    group  => 'vagrant',
    require => Package[$pip_requirements]
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
