class gui () {
  
  exec { 'update-gnome':
    command     => "gsettings set org.gnome.desktop.input-sources sources \"[('xkb', 'no')]\"",
    user => "vagrant"
  }

  exec { "snap-pycharm":
    command => "snap install pycharm-community --classic",
  }

  exec { "snap-gitkraken":
    command => "snap install gitkraken",
    require => Exec["snap-pycharm"],
  }
}
