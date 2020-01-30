class zsh () {
    package { "install-zsh":
    name => "zsh",
    provider => "apt",
    ensure => "latest",
  }

  exec { "conda-init-zsh":
    command => "/home/vagrant/miniconda/bin/conda init zsh",
    user => "vagrant",
    unless => 'grep -q "export PATH=\"/home/vagrant/miniconda/bin:\$PATH\"" /home/vagrant/.zshrc',
    require => Package["install-zsh"]
  }

}
