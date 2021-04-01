Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "docker-box"
  config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |vb|
    vb.name = "Docker_Box"
    vb.cpus = 4
    vb.memory = 6048
  end

  # Ports
  config.vm.network :forwarded_port, guest: 22, host: 2240, id: 'ssh'
  config.vm.network :forwarded_port, guest: 80, host: 80, id: '8080_port'


  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "~/.ssh/me.private"
  config.vm.provision "shell", inline: <<-SHELL
    cat /home/vagrant/.ssh/me.pub >> /root/.ssh/authorized_keys
    cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys
    mv /home/vagrant/.ssh/me.pub /home/vagrant/.ssh/id_rsa.pub
    mv /home/vagrant/.ssh/me.private /home/vagrant/.ssh/id_rsa
    chmod 400 /home/vagrant/.ssh/id_rsa*
  SHELL

 
  config.vm.synced_folder "shared/deploy", "/opt/deploy"
  config.vm.synced_folder "shared/develop", "/develop"git@github.com:dvillaj/compose-rstudio.git
  config.vm.provision "shell", inline: "/opt/deploy/install.sh"

end