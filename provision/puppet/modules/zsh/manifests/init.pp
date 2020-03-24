class zsh () {
    package { "install-zsh":
    name => "zsh",
    provider => "apt",
    ensure => "latest",
  }

  exec { "install-oh-my-zsh":
    user => "vagrant",
    cwd => "/home/vagrant",
    environment => ['ZSH=/home/vagrant/.oh-my-zsh', 'HOME=/home/vagrant'],
    command => 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended',
    creates => '/home/vagrant/.oh-my-zsh',
    require => Package["install-zsh"]  
  }

  exec { "conda-init-zsh":
    command => "/home/vagrant/miniconda/bin/conda init zsh",
    user => "vagrant",
    unless => 'grep -q "export PATH=\"/home/vagrant/miniconda/bin:\$PATH\"" /home/vagrant/.zshrc',
    require => Package["install-zsh"]
  }
}
