class jenkins (

  $java_package = "default-jdk-headless",
  ){

  package { $java_package:
    ensure => "latest",
    provider => "apt"
  }

   exec { "jenkins-apt-key":
    command => "wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -",
  }

   exec { "jenkins-repo":
    command => "sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'",
    require => Exec["jenkins-apt-key"],
  }

  exec { "jenkins-repo2":
    command => "add-apt-repository universe && apt-get update && apt-get install jenkins -y",
    require => Exec["jenkins-repo"],
  }

  exec { "ngrok":
    cwd => "/home/vagrant",
    user => "vagrant",
    creates => "/home/vagrant/ngrok-stable-linux-amd64.zip",
    command => "wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip",
  }

  exec { "ngrok-unzip":
    cwd => "/home/vagrant",
    creates => "/home/vagrant/ngrok",
    user => "vagrant",
    command => "unzip ngrok-stable-linux-amd64.zip",
  }
  
file { 'ngrok-permissions':
  path => "/home/vagrant/ngrok",
  mode => '0755'
}

file { "add-ngrok-system":
    path => "/etc/systemd/system/ngrok.service",
    source => "puppet:///modules/jenkins/ngrok.system",
    replace => 'no',
    owner => "vagrant",
    group => "vagrant",
    require => File["ngrok-permissions"]
  }

file { "add-ngrok-config":
    path => "/home/vagrant/ngrok_config.yml",
    source => "puppet:///modules/jenkins/ngrok_config.yml",
    replace => 'no',
    owner => "vagrant",
    group => "vagrant",
    require => File["add-ngrok-system"]
  }

 
}

 
  