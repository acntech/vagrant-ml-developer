class conda (
  $miniconda="Miniconda3-latest-Linux-x86_64.sh"
) {

    exec { "download-conda":
    command => "wget https://repo.continuum.io/miniconda/${miniconda} -O /tmp/${miniconda}",
    timeout => 1800,
    creates => '/home/vagrant/miniconda'
  }

    exec { "install conda":
    command => "bash /tmp/${miniconda} -b -p /home/vagrant/miniconda",
    require => Exec["download-conda"],
    creates => '/home/vagrant/miniconda'
  }

  exec { "add-to-bashrc":
    command => "echo 'export PATH=\"/home/vagrant/miniconda/bin:\$PATH\"' >> /home/vagrant/.bashrc",
    unless => 'grep -q "export PATH=\"/home/vagrant/miniconda/bin:\$PATH\"" .bashrc'
  }

}
