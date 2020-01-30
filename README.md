# AcnTech ML-developer

The AcnTech ML-developer Desktop is a Vagrant box is a premade image containing typical ml tool and utils. Created with Vagrant 2.2.6 and VirtualBox 6.0.14. The box comes in two flavours; desktop and minimal. 

<b>AcnTech ML-developer Desktop</b>  
See details in folder [/ml_developer-desktop]([/ml_developer-desktop).

<b>AcnTech ML-developer Minimal</b>  
See details in folder [ml_developer-minimal](ml_developer-minimal).

### Prerequisites
The host computer must have _Intel VT/AMD-V_ virtualization support enabled in the BIOS.
[Oracle VirtualBox 6.0](https://www.virtualbox.org) and [Vagrant](https://www.vagrantup.com) must also be installed on the host.

### Installed tools
The box has the following developer tools installed.

* zsh
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

### Python evnironments
The AcnTech ML-developer box comes with both Python and Anaconda (Miniconda) installed. By default python3 will refer the "native" python 3.6 installation which ships with ubuntu. To switch to/from Miniconda3-python type:

```bash
# Switch to miniconda
conda activate
# Switch back to native python
conda deactivate
```

### Connecting and authorization
username: vagrant  
pw: vagrant  
ssh key: https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub

To change insecure SSH-key update in Vagrantfile:
```
config.ssh.insert_key = true
```

<b>Port forwarding</b>  
AcnTech ML Developer forwards ssh-port to port 2222 (by default) on local host. To ssh into guest:

```bash
# standing in same folder as Vagrantfile of box in question
vagrant ssh # Connects to box automagically

# Connect with Putty/VSCode to Vagrantbox
ssh vagrant@127.0.0.1:2222 -i vagrant.pub
 ```
If port is already binded (for example by another box), vagrant reassigns port number automatically.  

Easiest way to find new port is to:  
Open virtualbox --> select desired machine --> Settings --> Network --> Advanced --> Port forwarding


#### Use box as remote environment
Support both in Pycharm Pro and Visual Studio Code makes it possible to use AcnTech ML developer box as a remote environment.

The procedure is tried and tested from VSCode with [remote development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extension. 


