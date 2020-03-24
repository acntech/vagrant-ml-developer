class conda (
  $miniconda="Miniconda3-latest-Linux-x86_64.sh"
) {

  exec { "download-conda":
    command => "wget https://repo.continuum.io/miniconda/${miniconda} -O /tmp/${miniconda}",
    timeout => 1800,
    creates => '/home/vagrant/miniconda'
  }

  exec { "install conda":
    user => "vagrant",
    command => "bash /tmp/${miniconda} -b -p /home/vagrant/miniconda",
    require => Exec["download-conda"],
    creates => '/home/vagrant/miniconda'
  }

  exec { "conda-init":
    command => "/home/vagrant/miniconda/bin/conda init",
    user => "vagrant",
    unless => 'grep -q "export PATH=\"/home/vagrant/miniconda/bin:\$PATH\"" /home/vagrant/.bashrc',
    require => Exec["install conda"]
  }

  exec { "disable-auto-activate":
    command => "/home/vagrant/miniconda/bin/conda config --set auto_activate_base false",
    user => "vagrant",
    require => Exec["conda-init"]
  }

}
