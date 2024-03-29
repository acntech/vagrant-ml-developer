# AcnTech ML-developer

The AcnTech ML-developer Desktop is a Vagrant box is a premade image containing typical ml tool and utils. Created with Vagrant 2.2.6 and VirtualBox 6.0.14. The box comes in two flavours; desktop and minimal. 

<b>AcnTech ML-developer Desktop</b>  
Based on [acntech/ubuntu](https://app.vagrantup.com/acntech/ubuntu) (Ubuntu 19.10)  
See details in folder [/ml_developer-desktop]([/ml_developer-desktop).   


<b>AcnTech ML-developer Minimal (recommended)</b>  
Based on [bento/ubuntu-20.04](https://app.vagrantup.com/bento/boxes/ubuntu-20.04) (Ubuntu 20.04)  
See details in folder [ml_developer-minimal](ml_developer-minimal).

### Prerequisites
The host computer must have _Intel VT/AMD-V_ virtualization support enabled in the BIOS.
[Oracle VirtualBox 6.0](https://www.virtualbox.org) and [Vagrant](https://www.vagrantup.com) must also be installed on the host.

### How to use ML-developer
The best way to use ML-develope is simply to create a new directory on your computer that contains a Vagranfile referencing this box
from Vagrant cloud. As a minimum as such:

```ruby
Vagrant.configure("2") do |config|
    
    # Change the Vagrantcloud box to use
    config.vm.box = "acntech/ml-developer-minimal"
    
    # Change box version to use 
    config.vm.box_version = "1.0.3"
    
end
```

For convenience a richer example file is placed in our github repo under /machines/ml_developer-minimal_example_machine. Please refer to this file for correct setup for portforwarding and basic virtualbox setup. 

### Installed tools
The box has the following developer tools installed.

* zsh
* Git 2.20.1
* Docker 19.03.5 Community Edition
  * Docker Compose 1.24.1
* Python 3.8.5
  * pip
  * python-venv
* Sqlite3 
* Miniconda3
* Poetry


###
Make zsh default shell:  
```bash
chsh -s $(which zsh) && zsh
```

### Python evnironments
The AcnTech ML-developer box comes with both Python and Anaconda (Miniconda) installed. By default python3 will refer the "native" python 3.8 installation which ships with ubuntu. To switch to/from Miniconda3-python type:

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


## Use box as remote environment
Support both in Pycharm Pro and Visual Studio Code makes it possible to use AcnTech ML developer box as a remote environment.

The procedure is tried and tested from VSCode with [remote development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extension. 

### Getting started with VSCode 
1. Install [VSCode](https://code.visualstudio.com/) on host machine
2. Install the VSCode [remote ssh-extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)  
```code --install-extension ms-vscode-remote.remote-ssh```
3. Configure SSH remote environment by:  
Remote Explorer -> Configure -> ```C:\Users\<USER\.ssh\config```
4. Add following configuration:  
```
Host <INSERT DESIRED MACHINE NAME>
  HostName 127.0.0.1
  Port 2222
  User vagrant
  IdentityFile <PATH TO VAGRANT FOLDER>\.vagrant\machines\default\virtualbox\private_key
```
5. Connect to host. 

### Troubleshooting
1. Check that path to SSH identity file is correct
2. Check if multiple boxes are running. If so check forward of port 22 and edit config to correct SSH port

### Extensions
Extensions must be installed on box to funtion. In extensions tab in VSCode install desired extension in remote environement. 


