# AcnTech ML-developer
The AcnTech ML-developer Desktop is a Vagrant box is a premade image containing typical ml tool and utils.

Created with Vagrant 2.2.6 and VirtualBox 6.0.14.

The box comes in two flavors, one based on Ubuntu and one based on Xubuntu.

### AcnTech ML-developer Desktop
See details in folder [/ml_developer-desktop]([/ml_developer-desktop).

### AcnTech ML-developer Minimal
See details in folder [ml_developer-minimal](ml_developer-minimal).

### Prerequisites
The host computer must have _Intel VT/AMD-V_ virtualization support enabled in the BIOS.

[Oracle VirtualBox](https://www.virtualbox.org) and [Vagrant](https://www.vagrantup.com) must also be installed on the host.

### Installed tools
The box has the following developer tools installed.

* Git 2.20.1
* Docker 19.03.5 Community Edition
  * Docker Compose 1.24.1
* Python3
  * pip
  * python-venv
* Sqlite3 
* Miniconda3
* Gitkraken (Desktop only)
* Pycharm Community edition (Desktop only)

### Authorization
username: vagrant  
pw: vagrant  
ssh key: https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub

To change insecure SSH-key update in Vagrantfile:
```
config.ssh.insert_key = true
```

